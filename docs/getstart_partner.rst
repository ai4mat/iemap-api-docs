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
Each metadata have to contain the information of a **single** computing or experimental process.
Below is a list of the core metadata fields supported by IEMAP:

* `project`__ , related project (e.g. Battery for Energy, Solar Panel or Electrolyzers)
* `process`__ , info of the computing or experimental process (code or instrument, method, ...)
* `material`__ , info of material (formula, its structure)
* `parameters`__ , list of parameters, input of the process 
* `properties`__ , list of properties, output of the process 

__ https://iemap-api.readthedocs.io/en/latest/project.html
__ https://iemap-api.readthedocs.io/en/latest/process.html
__ https://iemap-api.readthedocs.io/en/latest/material.html
__ https://iemap-api.readthedocs.io/en/latest/parameters.html
__ https://iemap-api.readthedocs.io/en/latest/properties.html 

.. note::
  See `here`__ to know the fields list.

__ https://iemap-api.readthedocs.io/en/latest/fields_table.html


Upload (meta)data via REST API
---------------

Once the metadata JSON file is created, you can upload (meta)data related to one computing or experimental process. 

.. code-block:: console

  IPADDR=https://ai4mat.enea.it/v1

.. note::
  Authentication is required (follow `this guideline`__).
__ https://iemap-api.readthedocs.io/en/latest/apiuser.html#authentication

1. Upload metadata

.. code-block:: console

  REQUEST=$(curl --location --request POST "$IPADDR/project/add" \
  --data-raw '{ \
  "json": <path/to/metadata.json> \
  }')

.. code-block:: console

  ID=echo($REQUEST)

2. Upload data files

.. code-block:: console

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