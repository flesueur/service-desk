General parameters
==================

Configuration files
-------------------

The default configuration file is ``conf/config.inc.php``, it contains all default values.
To edit configuration, you should create ``conf/config.inc.local.php`` and override needed parameters:

.. code-block:: php

    <?php
    // Override config.inc.php parameters below

    ?>

.. warning:: 
  Do not copy ``config.inc.php`` into ``config.inc.local.php``, as the first one includes the second.
  You would then create an infinite loop and crash your application.

Multi tenancy
-------------

You can load a specific configuration file by passing a HTTP header.
This feature is disable by default. To enable it:

.. code:: php

   $header_name_extra_config = "SSP-Extra-Config";

Then if you send the header ``SSP-Extra-Config: domain1``, the file
``conf/config.inc.domain1.php`` will be loaded.

Using Apache, we may set such header using the following:

.. code:: apache

    <VirtualHost *:80>
       ServerName ssp.domain1.com
       RequestHeader setIfEmpty SSP-Extra-Config domain1
       [...]
    </VirtualHost>

Using Nginx, we could use instead:

.. code:: nginx

   server {
       [...]
       location ~ \.php {
           fastcgi_param SSP-Extra-Config domain1;
           [...]
       }

Language
--------

.. tip:: Lang is selected from browser configuration. If no matching language is found, the default language is used.

Set default language in ``$lang``:

.. code-block:: php

    $lang = "en";


.. tip:: You can override messages by creating lang files in ``conf/``, for example ``conf/en.inc.php``.

Dates
-----

You can adapt how dates are displayed with specifiers (see `strftime reference`_):

.. _strftime reference: https://www.php.net/strftime

.. code-block:: php

    $date_specifiers = "%Y-%m-%d %H:%M:%S (%Z)";

Graphics
--------

Logo
^^^^

You change the default logo with your own. Set the path to your logo in ``$logo``:

.. code-block:: php

    $logo = "images/ltb-logo.png";

Background
^^^^^^^^^^

You change the background image with your own. Set the path to image in ``$background_image``:

.. code-block:: php

     $background_image = "images/unsplash-space.jpeg";

Custom CSS
^^^^^^^^^^

To easily customize CSS, you can use a separate CSS file:

.. code-block:: php

    $custom_css = "css/custom.css";

Footer 
^^^^^^

You can hide the footer bar:

.. code-block:: php

    $display_footer = false;

Debug
-----

You can turn on debug mode with ``$debug``:

.. code-block:: php

    $debug = true;

.. tip:: Debug messages will be printed in server logs.

This is also possible to enable Smarty debug, for web interface issues:

.. code-block:: php

   $smarty_debug = true;

.. tip:: Debug messages will appear on web interface.

Smarty
------

You need to define where Smarty is installed:

.. code-block:: php

    define("SMARTY", "/usr/share/php/smarty3/Smarty.class.php");

Audit
-----

If audit is needed audit file has to be opened in local config config.inc.local.php
audit_file should be explicilty open with "a"
path for audit file should exists and have write access for www-data user or group

.. code-block:: php

    $audit_file=fopen("/var/log/service-desk/audit.txt", "a");
