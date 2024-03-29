.. _project:
Project field
====================

IEMAP platform consists of three projects:

* *Materials for Batteries* (MB)
* *Materials for Electrolyzers* (ME)
* *Materials for Perovskite* (MPV)

The project field contains related project information, i.e. name and label.

.. list-table::
 :widths: 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``name``
   - String
   - Project name
 * - ``label``
   - String
   - Project label

Each data **requires** related project, so the choices are as follows:


.. list-table::
 :widths: 5 15 5
 :header-rows: 1

 * - Choices
   - Name
   - Label
 * - 1
   - Materials for Batteries
   - MB
 * - 2
   - Materials for Electrolyzers 
   - ME
 * - 3
   - Materials for Perovskite
   - MPV

.. note::
  Further project choices are not supported. 


Example
-------

If you need to upload a process data related to **batteries**, you have to insert the following metadata:

.. code-block:: json
  
  {
    "project":{
      "name": "Materials for Batteries",
      "label": "MB"
    }
  }

If you need to upload a process data related to **electrolyzers**, then:

.. code-block:: json
  
  {
    "project":{
      "name": "Materials for Electrolyzers",
      "label": "ME"
    }
  }

Otherwise, if you need to upload a process data related to **perovskite**, then:

.. code-block:: json
  
  {
    "project":{
      "name": "Materials for Perovskite",
      "label": "MPV"
    }
  }