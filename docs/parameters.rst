.. _parameters:
Parameters field
====================

The parameters field contains the parameters that acted on the process. 

Experimental parameters
-----------------------

The experimental parameters supported are:

.. list-table::
 :widths: 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``temperature``
   - Float
   - Temperature in (°C) as unit
 * - ``pressure``
   - Float
   - Pressure in (mbar) as unit
 * - ``flow``
   - Float
   - Flow in (ml) as unit
 * - ``wavelength``
   - Float
   - Wavelenght in (nm) as unit
 * - ``frequency``
   - Float
   - Frequency in (Hz) as unit
 * - ``current``
   - Float
   - Elettrical current in Ampere (A) as unit
 * - ``printing force``
   - Float
   - Printing force in Newton (N) as unit
 * - ``printing speed``
   - Float
   - Printing speed in (m/min) as unit
 * - ``precursor materials``
   - Array
   - List of precursor materials
 * - ``precursor details``
   - String
   - Details of precursor material
 * - ``antisolvent``
   - String
   - Antisolvent
 * - ``solvents``
   - String
   - Solvents
 * - ``solution details``
   - String
   - Details of solution
 * - ``relevant fabrication parameters``
   - String
   - 
 * - ``experimental conditions``
   - String
   - 
 * - ``film appearance``
   - String
   - 


Computational parameters
------------------------

The computational parameters supported are:

.. list-table::
 :widths: 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``calculation``
   - String
   - Type of calculation (scf, vc-relax, ...)
 * - ``exchange_correlation``
   - String
   - Exchange correlation, such as 'pbe'.


Example
-------

If you need to upload an experimental process data using precursor materials, solvents, antisolvent, solution details, experimental conditions, film appearance and relevant fabrication parameters, you have to insert the following metadata:

.. code-block:: json
  
  {
    "parameters":[
      {
        "name": "precursor materials",
        "value": ["MAI", "Pbl2"]
      },
      {
        "name": "precursor details",
        "value": "freshly prepared"
      },
      {
        "name": "antisolvent",
        "value": "Diethyl Ether"
      },
      {
        "name": "solvents",
        "value": "DMF:DMSO (9:1)"
      },
      {
        "name": "solution details"
        "value": "1.40 M"
      },
      {
        "name": "relevant fabrication parameters",
        "value": "1000 rpm-200rpm/s-10s"
      },
      {
        "name": "experimental conditions",
        "value": "deposition in air"
      },
      {
        "name": "film appearance",
        "value": "Shining dark brown film"
      }
    ]
  }

If you need to upload a Quantum Espresso parameters, then:

.. code-block:: json
  
  {
    "parameters":{
       "calculation": "vc-relax",
       "exchange_correlation": "pbe"
    }
  }