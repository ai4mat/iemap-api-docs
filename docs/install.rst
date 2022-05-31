How to install
================

Get the code
------------


First of all you need to get the code:

.. code-block:: bash

    git clone https://github.com/ai4mat/mi-api.git

and jump to its folder:

.. code-block:: bash

    cd mi-api


Make some configurations
------------------------


You first need to setup configurations into the environments file. Copy the :code:`env.sample` into :code:`.env` and edit this file for each variable.


Run on local machine
---------------------


* 1 - Export the variables
    First of all you need to export variables into the environment with:

    .. code-block:: bash

        export $(xargs < .env)

    After that you need to create the python environment. You can choose to use :code:`pip` or :code:`poetry`.  


* 2a - Setup python environment with pip
    Create the virtualenv (assuming you have python 3.X) and activate it:

    .. code-block:: bash

        python3 -m venv <your-virtual-env>
        source <your-virtual-env>/bin/activate


    Then install requirements:

    .. code-block:: bash

        pip install -r requirements


* 2b - Setup python environment with poetry
    Install :code:`poetry`:

    .. code-block:: bash

        curl -sSL https://install.python-poetry.org | python3 -


    Run the following commands to bootstrap your environment with :code:`poetry`:

    .. code-block:: bash

        poetry install
        poetry shell


* 3 - Run the server
    Now you're ready to start the API just with:

    .. code-block:: bash

        cd app/
        uvicorn main:app --reload



Run as container 
-----------------

* 0 - Prerequisites
    In the following we are assuming that you can manage docker with a non-root user. To do so, run the following commands:

    .. code-block:: bash

        sudo groupadd docker
        sudo usermod -aG docker $USER


    You had created the :code:`docker` group first and then added your user to it. This way now you can build, run and stop containers with your user, without worrying about :code:`sudo`.

* 1 - Configuration
    Add this to your server :code:`.bashrc` or :code:`.profile`:

    .. code-block:: bash
        
        export HOST_FILESDIR=<absoloute path where uploaded files are stored on host>
        export FILESDIR=<path where files are stored inside the container>


    to set this variable both inside and outside container.

* 2 - Build image and run container
    Run the following command to build the image and run the container:

    .. code-block:: bash
        
        make all

    You can also run multiple containers from the same builded image. You need to build first and then run each container on different port. To do so, run the following command:

    .. code-block:: bash
        
        make build

    And then run each container:

    .. code-block:: bash

        make HOST_PORT=<port> run

    In the following a complete list of commands defined into the :code:`Makefile`, to simplify container managment:

    .. list-table:: Commands defined into the Makefile
        :widths: 50 25
        :header-rows: 1

        * - Action
          - :code:`command`
        * - Build and run 
          - :code:`make all` 
        * - Build image 
          - :code:`make build` 
        * -  Run container 
          - :code:`make run` 
        * - Stop container 
          - :code:`make stop` 
        * - Start container 
          - :code:`make start` 
        * - Kill (stop & remove container) 
          - :code:`make kill` 
        * - Clean (remove eventually dead containers and remove images)  
          - :code:`make clean` 


    .. note::
        To get the list of running containers (with their IDs), run:
        
        .. code-block:: bash

            docker ps

* 3 - Configure NGINX as reverse proxy
    Create a new virtual host in your :code:`/etc/nginx/sites-available` folder and add the following configuration (supposing you are running with SSL/TLS encryption):

    .. code-block:: bash

        server {
            listen 80;
            server_name <your-domain-name>;
            return 301 https://$server_name$request_uri;
        }

        server {
            listen 443 ssl;
            server_name <your-domain-name>;

            ssl_certificate /etc/letsencrypt/live/<your-domain-name>/fullchain.pem;
            ssl_certificate_key /etc/letsencrypt/live/<your-domain-name>/privkey.pem;
            
            location / {
                proxy_pass http://127.0.0.1:8000;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-NginX-Proxy true;
                proxy_redirect off;
                proxy_pass_request_headers on;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
            }
        }


* 3 Bis - Configure NGINX as load balancer
    If you're running multiple containers on the same server, you can configure NGINX as load balancer. To do so, you need to create a new virtual host in your :code:`/etc/nginx/sites-available` folder and add the following configuration:

    .. code-block:: bash

        upstream backend {
            least_conn;
            server 127.0.0.1:<port1>;
            server 127.0.0.1:<port2>;
            ...
        }

        server {
            listen 80;
            server_name <your-domain-name>;
            return 301 https://$server_name$request_uri;
        }

        server {
            listen 443 ssl;
            server_name <your-domain-name>;

            ssl_certificate /etc/letsencrypt/live/<your-domain-name>/fullchain.pem;
            ssl_certificate_key /etc/letsencrypt/live/<your-domain-name>/privkey.pem;

            location / {
                proxy_pass http://backend;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-NginX-Proxy true;
                proxy_redirect off;
                proxy_pass_request_headers on;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
            }
        }

    .. note::
        We have configured the load balancer with the *Least connections* algorithm. This means that the server with the least connections will be used. If you want to use the *Round-Robin* algorithm, you can change the :code:`least_conn` in the :code:`upstream` definition to :code:`round_robin`.

* 4 - Check and restart NGINX
    Check the configuration and activate the new virtual host:

    .. code-block:: bash

        sudo nginx -t

    If the check is ok, then create the symbolic link into the :code:`/etc/nginx/sites-enabled` folder:

    .. code-block:: bash
        
        ln -s /etc/nginx/sites-available/<your-vhost-name> /etc/nginx/sites-enabled/<your-vhost-name>


    Then reload the web server configuration:

    .. code-block:: bash

        sudo nginx -s reload


Check API
---------

* 1a - Check if the API is running locally
    To check if the API is running locally, run the following command:

    .. code-block:: bash

        curl -i http://localhost:8000

* 1b - Check if the API is running on the server (with SSL/TLS encryption)
    To check if the API is running on the server, run the following command:

    .. code-block:: bash

        curl -i https://<your-domain-name>

* 2 - Expected behavior
    If all is working properly, you'll get this output:

    .. code-block:: json

        {
            "request_method": "GET",
            "path_name": "",
            "message": "Reply from IEMAP API at <current time and date>"
        }
