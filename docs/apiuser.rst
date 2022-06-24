How to use IEMAP API
====================

Registration
------------

If you are not in the user group, you can register for at the endpoint:

.. code-block:: shell-session

    https://ai4mat.enea.it/v1/register


providing the following informations:


.. code-block:: json

    {
        "email": "user@example.com", 
        "password": "string", 
        "affiliation": "string"
    }

.. note::

    There are three more fields that is not possible to handle in this json. That fields are related to authorization and verification which are managed at the database level by the management team.

After that, you need to contact the management team to get the verification. You can do that by emailing the management team at: `info@mission-innovation.it <mailto: info@mission-innovation.it>`_.


Authentication
---------------

If you have a verified user, you can login at the endpoint:

.. code-block:: shell-session

    https://ai4mat.enea.it/v1/login

providing `username` and `password`, or by clicking the `Authorize` button on the website, filling in with the same informations.


API endpoints
--------------


Examples
--------