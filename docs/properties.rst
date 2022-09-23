.. _properties:
Properties field
====================

The properties field contains the properties returned by the process. 

Experimental properties
-----------------------

The experimental properties supported are:

.. list-table::
 :widths: 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``cte``
   - Float
   - Coefficient of thermal expansion (°C\ :sup:`-1`)
 * - ``young module``
   - Float
   - Young's modulus (dyne/cm\ :sup:`2`)
 * - ``trasmittance``
   - Float
   - Trasmittance in percentage (%)
 * - ``reflectance``
   - Float
   - Reflectance in percentage (%)
 * - ``workfunction``
   - Float
   - Workfunction in (eV)
 * - ``resistivity``
   - Float
   - Resistivity in (ohm)
 * - ``plasma characteristics``
   - Array of Float
   - (I,V,W)
 * - ``weight``
   - Float
   - Weight in (g)
 * - ``density``
   - Float
   - Density in (g/cm\ :sup:`3`)
 * - ``corona treatment``
   - Float
   - Corona treatment in (W)
 * - ``viscosity``
   - Float
   - Viscosity in (mPas)
 * - ``layer conductivity``
   - Float
   - Layer conductivity in (S/cm\ :sup:`2`)
 * - ``purity``
   - Float
   - Purity in (wt.%)
 * - ``ionic conductivity``
   - Float
   - Ionic conductivity in (mS cm\ :sup:`2`)
 * - ``thermal stability``
   - Float
   - Thermal stability in (°C)
 * - ``electrochemical stability``
   - Float
   - Electrochemical stability in (V)
 * - ``photoluminescence quantum yield``
   - Float
   - Photoluminescence quantum yield in (%)
 * - ``raman analysis``
   - Float Bi-dimensional
   - Chemical bonds/Intensity of ligh as a function of Raman shift
 * - ``ftir analysis``
   - Float Bi-dimensional
   - Chemical bonds/intensity of ligh as a function of light frequency
 * - ``x-ray diffraction``
   - Float Bi-dimensional
   - Semi-quantitative recognition of crystallographic phases and crystallite size/Intensity as a function of the diffracted angle
 * - ``afm``
   - Float Bi-dimensional
   - Surface morphology/ Height profile as a function of the position
 * - ``dinamic light scatytering``
   - Float Bi-dimensional
   - Particle size dimension distribution/ Number of particles as a function of particle size 


Computational properties
------------------------

The computational properties supported are:

.. list-table::
 :widths: 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``band gap``
   - Float
   - Band gap in (eV)
 * - ``total_energy``
   - Float
   - Total energy in (eV)
 * - ``formation_energy``
   - Float
   - Formation energy in (eV)
 * - ``redox potential``
   - Float
   - Redox (intercalation) potential in (V)
 * - ``volume``
   - Float
   - volume in (mm\ :sup:`3`)


Example
-------

If you need to upload an experimental process data with energy gap, annealing temperature and time as properties, you have to insert the following metadata:

.. code-block:: json
  
  {
    "properties": {
        "annealing temperature": 50,
        "annealing time": 120,
        "energy gap": 1.60
    }
  }

If you need to upload a Quantum Espresso properties, then:

.. code-block:: json
  
  {
    "properties":{
     "total_energy": -106845.63979092,
     "volume": 1037.2723079868,
     "formation_energy_per_atom": -1.654192855
   }
  }