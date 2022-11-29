Upload data files via REST API
====================

Once you made the metadata file, you can upload the files by following steps.

.. note::
  The registration is required. Follow the `guide video`__ (main page) if you didn't already.

__ https://ai4mat.enea.it/dashboard/

0. **Init**

You have to install the environment.

.. code-block:: console

  $ pip install iemap

Then the login is required using __username__ and __password__ via __iemap__ module.

.. code-block:: python

  from iemap import IEMAP

  # usr is the user's email
  api = IEMAP(usr, pwd)
  # login 
  api.login()


1. **Upload metadata**

.. code-block:: python

  api.save(metadata = "path/to/metadata.json")


2. **Upload data files**

.. code-block:: python

  files = ["path/to/datafile.csv", "path/to/datafile.in", ...]

.. code-block:: python

  api.save_project_files(project_files = files)

.. note::
  You need to **repeat from step 1** for each process.


Running Example
--------

A Python notebook has been created to simplify uploading (:download:`code <_static/code.zip>`).

.. note::
  For any issue, you can contact the management team by emailing at: `info@mission-innovation.it <mailto: info@mission-innovation.it>`_.