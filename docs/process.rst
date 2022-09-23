.. _process:
Process field
====================


The process field contains the information related to computational or experimental procedure, e.g. method, code or instrument used.

.. list-table::
 :widths: 5 6 10
 :header-rows: 1

 * - Field name
   - Type
   - Description
 * - ``method``
   - String
   - Method or Technique
 * - ``agent``
   - Object
   - Info of code or instrument used (name and version)
 * - ``isExperimental``
   - Boolean
   - *True* if the process is an experiment, *False* otherwise.
 * - ``isSimulation``
   - Boolean
   - *True* if the process is a atomic computing, *False* otherwise.

Methods
-------

The methods supported are:

.. list-table::
 :widths: 10 15 
 :header-rows: 1

 * - Process Type
   - Method Name
 * - Experiment
   - spin-coating   
 * - Experiment
   - ... 
 * - Experiment
   - ...
 * - Computing
   - dft
 * - Computing
   - ...

.. note::
  Further choices are not supported.

Agents
-------

The agents supported are:

.. list-table::
 :widths: 5 15 
 :header-rows: 1

 * - Agent Type
   - Agent Name
 * - Instrument
   - Impedance Analyzer Gamry Reference 600
 * - Instrument
   - UV-Vis spectrometer Shimadzu UV-2600
 * - Instrument
   - Spectrofluorimeter JASCO FP-8300
 * - Instrument
   - A source meter unit Agilent B2910
 * - Instrument
   - X-ray powder Diffractometer Bruker-Siemens D5000
 * - Instrument
   - Micromeritics Autochem 2910
 * - Instrument
   - Micromeritics ASAP 2020
 * - Instrument
   - Thermical Analyzer Mettler TGA/DSC1 STAR
 * - Instrument
   - Potentiostatical frequency-response analyzer Autolab PGSTAT30
 * - Instrument
   - Spectrophotometer Perkin Elmer lambda 900
 * - Instrument
   - VG Escalab MKII  
 * - Instrument
   - Oscilloscopes Tektronix  
 * - Instrument
   - Sourcemeter Keithley  
 * - Instrument
   - Plasma optical emission spectrometer Ocean Optics  
 * - Instrument
   - Optical Microscopy  
 * - Instrument
   - Electron Microscopy  
 * - Instrument
   - X ray Diffractograms  
 * - Instrument
   - Viscosimeter
 * - Instrument
   - Probes Conductimeter  
 * - Instrument
   - Scanning Electron Microscopy  
 * - Instrument
   - Gravure printer  
 * - Instrument
   - Balance  
 * - Instrument
   - Densimeter  
 * - Instrument
   - PH-meter 
 * - Instrument
   - Thermometer  
 * - Instrument
   - Hood  
 * - Instrument
   - Lab-glassware  
 * - Instrument
   - Mixer  
 * - Instrument
   - Rotary-evaporator  
 * - Instrument
   - Vacuum even  
 * - Instrument
   - Glove-bis  
 * - Instrument
   - Raman spectrometer LabRam HR Evolution (HORIBA)  
 * - Instrument
   - AFM (HORIBA)  
 * - Instrument
   - FTIR IS50 (ThermoFisher) provided with ATR module  
 * - Instrument
   - XRD (Empyrean Panalytical)  
 * - Instrument
   - SEM/EDX  
 * - Instrument
   - Dynamic Light Scattering (Malvern)  
 * - Instrument
   - Spectrometer  
 * - Instrument
   - Aixtron G4
 * - Code
   - Quantum Espresso
 * - Code
   - Yambo
 * - Code
   - Orca
 * - Code
   - CP2K
 * - Code
   - Gibbs2
 * - Code
   - Critic2

.. note::
  Further choices are not supported. 


Example
-------

If you need to upload a computational process data that has performed a dft calculation with Quantum Espresso code, you have to insert the following metadata:

.. code-block:: json
  
  {
    "process":{
      "method": "dft",
      "agent": {
        "name": "Quantum Espresso",
        "version": "6.7"
      },
      "isExperimental": false,
      "isSimulation": true
    }
  }

If you need to upload an experimental process data that has analyzed a spin coating method using "Spectrophotometer Perkin Elmer lambda 900" as instrument, then:

.. code-block:: json
  
  {
    "process":{
      "method": "spin-coating",
      "agent": {
        "name": "Spectrophotometer Perkin Elmer lambda 900",
        "version": ""
      },
      "isExperimental": true,
      "isSimulation": false
    }
  }