***********************************
Netresearch pre-commit hook for Git
***********************************

Features
========
* Checks staged files only
* File content checks:

  * wrong lineendings
  * no BOM
* PHP checks:

  * syntax
  * var_dump, debug_print_backtrace, print_r
* commit message checks

  * issue number required
* Coding standards checks

  * forbid the commit if violations are found
  * Configuration for Coding Standard


Installation
============
Symlink the ``pre-commit`` script into your ``.git/hooks`` directory.


Setup
=====
Deactivate coding standards check::

    $ git config pre-commit.phpcs 0

Change your coding standard::

    $ git config pre-commit.phpcs-standard PEAR

Set the phpcs file encoding::

    $ git config pre-commit.phpcs-encoding iso-8859-1
