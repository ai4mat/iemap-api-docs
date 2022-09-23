.. _material:
Material field
====================

The meterial field contains the information related to analyzed material, e.g. formula, composition or structure.


.. list-table::
 :widths: 5 6 10
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
 :widths: 5 6 10
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
