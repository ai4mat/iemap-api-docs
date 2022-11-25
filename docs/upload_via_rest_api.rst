



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