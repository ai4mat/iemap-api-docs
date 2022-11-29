Upload data files via REST API
====================

Once you made the metadata file, you can upload the files by following steps.

.. note::
  The registration is required. Follow the `guide video`__ (main page) if you didn't already.

__ https://ai4mat.enea.it/dashboard/

0. Init

You have to install the environment.
.. code-block:: console

  pip install iemap

Then the login is required using user name and password via iemap module.
.. code-block:: python

  > from iemap import IEMAP
  
  > api = IEMAP( usr, pwd)


1. Upload metadata

.. code-block:: python

  REQUEST=$(curl --location --request POST "$IPADDR/project/add" \
  --data-raw '{ \
  "json": <path/to/metadata.json> \
  }')


1. Upload data files

.. code-block:: python

  curl --location --request POST "$IPADDR/project/add/file" \
  --data-raw '{ \
  "inserted_id": '$ID', \
  "file": <path/to/datafile> \
  }'

.. note::
  You need to repeat the second command for each data file.


Running Example
--------

This section shows you a running example in order to upload your (meta)data on IEMAP's database and repository.
First of all, the data of both processes are used as examples.

* `computational process data`__
* `experimental process data`__

__ https://iemap-api.readthedocs.io/en/latest/computational_example.html
__ https://iemap-api.readthedocs.io/en/latest/experimental_example.html

A script has been created to simplify uploading (:download:`script <_static/script.sh>`).

Assuming the JSON file name is 'metadata.json', the uploading script can be ran as follow:

.. code-block:: console

  chmod +x script.sh

  ./script.sh -m metadata.json -f data/* -p properties/*

.. note::
  For any issue, you can contact the management team by emailing at: `info@mission-innovation.it <mailto: info@mission-innovation.it>`_.