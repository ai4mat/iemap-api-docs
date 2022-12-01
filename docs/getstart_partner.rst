How to upload
====================

The IEMAP's REST API needs a metadata JSON file to complete the upload.
In this section, we describe how to upload data of a computing or experimental process on the IEMAP database. 
The steps are two:

1. `Create metadata`__
2. `Upload metadata and data files`__

__ https://iemap-api.readthedocs.io/en/latest/getstart_partner.html#create-metadata
__ https://iemap-api.readthedocs.io/en/latest/getstart_partner.html#upload-meta-data-files

Create metadata
------------

The IEMAP's REST API only accepts the metadata with a specific JSON format, so you need to map data into IEMAP's JSON structure.
Each metadata has to contain the information of one **single** computing or experimental process.
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

To simplify, a summary document was created (:download:`fields supported <_static/fields.xlsx>`).

.. note::
  See `here`__ to know the fields list.

__ https://iemap-api.readthedocs.io/en/latest/fields_table.html

We provide two process examples, one computational and one experimental:

* `computational process data`__
* `experimental process data`__

__ https://iemap-api.readthedocs.io/en/latest/computational_example.html
__ https://iemap-api.readthedocs.io/en/latest/experimental_example.html

Upload (meta)data files
---------------

Once the metadata JSON file is created, you can upload (meta)data related to one computing or experimental process. 
There are two modes to upload the metadata and data files:

1. via `Web Interface`__

2. via `REST API`__

__ https://iemap-api.readthedocs.io/en/latest/upload_via_web_interface.html
__ https://iemap-api.readthedocs.io/en/latest/upload_via_rest_api.html

.. note::
  The registration is required. Follow the `guide video`__ (main page) if you didn't already.

__ https://ai4mat.enea.it/dashboard/

.. note::
  For any issue, you can contact the management team by emailing at: `info@mission-innovation.it <mailto: info@mission-innovation.it>`_.