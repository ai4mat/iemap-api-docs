Fields Table
====================

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
 * - ``material.formula``
   - string
   - Formula del composto chimico analizzato
   - _True_
   - 
 * - ``material.lattice``
   - object
   - (a,b,c),(alpha, beta, gamma)
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``material.input.sites``
   - list
   - Sites del materiale di input
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``material.input.species``
   - list
   - Species del materiale di input
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``material.output.sites``
   - list
   - Sites del materiale di output
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``material.output.species``
   - list
   - Species del materiale di output
   - _True_ se il processo è computazionale, altrimenti _False_
   - 
 * - ``parameters``
   - Object
   - Dizionario che racchiude i parametri di processo, dove ogni elemento associa il nome del parametro al suo valore.
   - _False_
   - 
 * - ``properties``
   - Object
   - Dizionario che racchiude le proprietà di processo, dove ogni elemento associa il nome della proprietà al suo valore.
   - _True_ (at least one)
   - 
