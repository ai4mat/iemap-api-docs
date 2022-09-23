.. _material:
Material field
====================

The meterial field contains the information related to analyzed material, e.g. formula, composition or structure.


.. list-table::
 :widths: 5 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``formula``
   - String
   - Material formula
 * - ``input``
   - Object
   - Info of input structure. Only required for computational processes.
 * - ``output``
   - Object
   - Info of output structure. Only required for computational processes.

The *input* and *output* objects have to contain:

.. list-table::
 :widths: 5 5 6 10
 :header-rows: 1

 * - Field name
   - Subfield name
   - Type
   - Description
 * - ``lattice``
   - 
   - Object
   - Lattice
 * - 
   - ``a``
   - Object
   - Lattice
 * - 
   - ``b``
   - Object
   - Lattice
 * - 
   - ``c``
   - Object
   - Lattice
 * - 
   - ``alpha``
   - Object
   - Lattice
 * - 
   - ``beta``
   - Object
   - Lattice
 * - 
   - ``gamma``
   - Object
   - Lattice
 * - ``sites``
   - 
   - Array
   - List of atoms sites. 
 * - ``species``
   - 
   - Array
   - List of atoms species.

.. notes::
    Angstrom unit is supported.

Example
-------

If you need to upload an experimental process data on 'CH\ :sub:`3`NH\ :sub:`3`PbI\ :sub:`3`' as material, you have to insert the following metadata:

.. code-block:: json
  
  {
    "material":{
      "formula": "CH3NH3PbI3"
    }
  }

If you need to upload a computational process data on 'NaMnO\ :sub:`2`' as material, then:

.. code-block:: json
  
  {
    "material":{
      "formula": "NaMnO2",
      "input":{
        "lattice":{},
        "species": ["O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","Na","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na"],
        "sites": [[0.13795179349174, -0.24690325664231, 0.23763066813437], [2.5501200061335, 1.4339330853802, 0.27321523160776], [0,0,0]]
      },
      "output":{
        "lattice":{},
        "species": ["O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","Na","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na","O","O","O","Mn","Mn","Mn","O","O","O","Na"],
        "sites": [[0.13795179349174, -0.24690325664231, 0.23763066813437], [2.5501200061335, 1.4339330853802, 0.27321523160776], [0,0,0]]
      }
    }
  }