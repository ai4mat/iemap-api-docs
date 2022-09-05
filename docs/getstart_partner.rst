How to upload
====================

The IEMAP's REST API needs a metadata JSON file to complete the upload.
In this section, we describe how to upload data of a computing or experimental process on the IEMAP database. 
The steps are two:

1. `Create metadata`__
2. `Upload metadata and data via REST API`__

__ https://iemap-api.readthedocs.io/en/latest/getstart_partner.html#create-metadata
__ https://iemap-api.readthedocs.io/en/latest/getstart_partner.html#upload-meta-data-via-rest-api

Create metadata
------------

The IEMAP's REST API only accepts the metadata with a specific JSON format, so you need to map data into IEMAP's JSON structure.
The list of the structure's fields is the following:

.. list-table::
 :widths: 25 10 10 50 5
 :header-rows: 1

 * - Field name
   - Type
   - Description
   - Required
   - Choices
 * - ``project.name``
   - string
   - Nome Progetto
   - _True_
   - ['Energia per le batterie', 'Pannelli fotovoltaici', 'Elettrolizzatori']
 * - ``project.label``
   - string
   - Label Progetto
   - _True_
   - ['EB', 'PF', 'EE']
 * - ``project.description``
   - string
   - Descrizione Progetto
   - _True_
   - 
 * - ``process.method``
   - string
   - Metodo (computazionale) o tecnica (sperimentale) del processo
   - _True_
   - ['dft']
 * - ``process.agent.name``
   - string
   - Strumento o codice utilizzato
   - _True_
   - 
 * - ``process.agent.version``
   - string
   - Versione dello codice o del firmware dello strumento
   - _True_
   - 
 * - ``process.isExperiment``
   - boolean
   - _True_ se sperimentale, altrimenti _False_
   - _True_
   - 
 * - ``process.isSimulation``
   - boolean
   - _True_ se computazionale, altrimenti _False_
   - _True_
   - 
 * - ``process.material.formula``
   - string
   - Formula del composto chimico analizzato
   - _True_
   - 
 * - ``process.material.lattice``
   - object
   - (a,b,c),(alpha, beta, gamma)
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``process.material.input.sites``
   - list
   - Sites del materiale di input
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``process.material.input.species``
   - list
   - Species del materiale di input
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``process.material.output.sites``
   - list
   - Sites del materiale di output
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``process.material.output.species``
   - list
   - Species del materiale di output
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``process.parameters``
   - Object
   - Dizionario che racchiude i parametri di processo, dove ogni elemento associa il nome del parametro al suo valore.
   - _False_
   - 
 * - ``process.properties``
   - Object
   - Dizionario che racchiude le proprietà di processo, dove ogni elemento associa il nome della proprietà al suo valore.
   - _True_ (at least one)
   - 


Upload (meta)data via REST API
---------------

Once the metadata JSON file is created, you can upload (meta)data related to one computing or experimental process. 

.. code-block:: shell-session
  IPADDR=https://ai4mat.enea.it/v1

.. note::
  You need authentication using `this guideline`__.
__ https://iemap-api.readthedocs.io/en/latest/apiuser.html#authentication

1. Upload metadata

.. code-block:: shell-session
  REQUEST=$(curl --location --request POST "$IPADDR/project/add" \
  --data-raw '{ \
  "json": <path/to/metadata.json> \
  }')

.. code-block:: shell-session
  ID=echo($REQUEST)

2. Upload data files

.. code-block:: shell-session
  curl --location --request POST "$IPADDR/project/add/file" \
  --data-raw '{ \
  "inserted_id": $ID, \
  "file": <path/to/datafile> \
  }'

.. note::
  You need to repeat the second command for each data file.

Running Example
--------

This section shows you a running example in order to upload your (meta)data on IEMAP's database and repository.
First of all, the data of both processes are used as examples.


<details> <summary>computational process data</summary>
.. literalinclude:: _static/metadata_computational_example.json
    :language: json
 
</details>

<details> <summary>experimental process data</summary>
.. literalinclude:: _static/metadata_experimental_example.json
    :language: json
 
</details>

Assuming the JSON file name is 'metadata.json', the uploading script can be ran as follow:

.. code-block:: shell-session

    https://ai4mat.enea.it/v1/login