AD Password
===========

This is a very simple tool intended to simplify keeping the passwords for several Active Directory accounts synchronized. It supports multiple accounts across multiple domains/forests.

Pre-Requisites
--------------

This tool assumes that all the accounts have synchronized passwords. If this is not the case, you will need to change those passwords that need it to bring everything into sync.

Configuration
-------------

Copy the sample config file in the config directory and rename it `config.xml`. The structure of this file is very straightforward:

    config (root element)
      domain
        user
        user
      domain
        user
        user

There is no limit to the number of domains that can be defined, or the number of users per domain.
