How to upload
====================

The IEMAP's REST API needs a metadata JSON file to complete the upload.
In this section, we describe how to upload data of a computing or experimental process on the IEMAP database. 
The steps are two:
1. Create metadata
2. Upload metadata and data via REST API

Create metadata
------------

The IEMAP's REST API only accepts the metadata with a specific JSON format, so you need to map data into IEMAP's JSON structure.
The list of the structure's fields is the following:

.. list-table::
   :widths: 25 10 10 50 5
   :header-rows: 1

 * - Field name
   - Type
   - Choices 
   - Description
   - Required
 * - ``project.name``
   - string
   - ['Energia per le batterie', 'Pannelli fotovoltaici', 'Elettrolizzatori']
   - Nome Progetto
   - _True_
 * - ``project.label``
   - string
   - ['EB', 'PF', 'EE']
   - Label Progetto
   - _True_
 * - ``project.description``
   - string
   - 
   - Descrizione Progetto
   - _True_
 * - ``process.method``
   - string
   - ['dft']
   - Metodo (computazionale) o tecnica (sperimentale) del processo
   - _True_
 * - ``process.agent.name``
   - string
   - 
   - Strumento o codice utilizzato
   - _True_
 * - ``process.agent.version``
   - string
   - 
   - Versione dello codice o del firmware dello strumento
   - _True_
 * - ``process.isExperiment``
   - boolean
   - 
   - _True_ se sperimentale, altrimenti _False_
   - _True_
 * - ``process.isSimulation``
   - boolean
   - 
   - _True_ se computazionale, altrimenti _False_
   - _True_
 * - ``process.material.formula``
   - string
   - 
   - Formula del composto chimico analizzato
   - _True_
 * - ``process.material.lattice``
   - object
   - 
   - (a,b,c),(alpha, beta, gamma)
   - _True_ se il processo è computazionale, altrimenti _False_
 * - ``process.material.input.sites``
   - list
   - 
   - Sites del materiale di input
   - _True_ se il processo è computazionale, altrimenti _False_
 * - ``process.material.input.species``
   - list
   - 
   - Species del materiale di input
   - _True_ se il processo è computazionale, altrimenti _False_
 * - ``process.material.output.sites``
   - list
   - 
   - Sites del materiale di output
   - _True_ se il processo è computazionale, altrimenti _False_
 * - ``process.material.output.species``
   - list
   - 
   - Species del materiale di output
   - _True_ se il processo è computazionale, altrimenti _False_
 * - ````
   - string
   - 
   -
 * - ````
   - string
   - 
   -
 * - ````
   - string
   - 
   -


.. code-block:: json

    {
        "email": "user@example.com", 
        "password": "string", 
        "affiliation": "string"
    }


Upload (meta)data via REST API
---------------

Once the metadata JSON file is created, you can upload (meta)data related to one computing or experimental process. 

.. code-block:: shell-session

    https://ai4mat.enea.it/v1/login

.. note::


Running Example
--------