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
  * Superfluous whitespace after closing PHP tag
* JavaScript syntax checks
* JSON syntax checks
* XML and HTML syntax checks (well-formedness)
* commit message checks

  * issue number required (Jira-like or TYPO3.org)
* Coding standards checks

  * forbid the commit if violations are found
  * Configuration for Coding Standard
  * ``jshint`` checks


Installation
============
Symlink the ``pre-commit`` script into your ``.git/hooks`` directory.


Dependencies
------------
* ``acorn`` for JavaScript syntax checks (``npm -g install acorn``)
* ``jshint`` for JavaScript coding style checks (``npm -g install jshint``)
* ``json_pp`` for JSON syntax checks (in the Debian ``perl`` package)
* ``php`` for PHP syntax checks
* ``pcregrep`` for PHP whitespace check
* ``html-validator`` for HTML5 check (``npm -g install {vnu-jar, html-validator-cli}``, )
* ``xmllint`` for XML syntax checks


Global installation
-------------------
To automatically install this hook in new repositories, symlink it into
the git hook templates dir::

    $ cd /usr/share/git-core/templates/hooks/
    $ ln -s /usr/local/src/git-client-hooks/hooks/pre-commit
    $ ln -s /usr/local/src/git-client-hooks/hooks/commit-msg


Per-repository installation with an alias
-----------------------------------------
Create the (user-) global git alias at first::

    $ ./create-global-alias.sh

To make it available to all users on the machine, run (as root)::

    $ ./create-system-alias.sh

Then you can run it in any git repository::

    $ git setup-hooks


Setup
=====
Deactivate coding standards check::

    $ git config pre-commit.phpcs 0

Change your coding standard::

    $ git config pre-commit.phpcs-standard PEAR

Set the phpcs file encoding::

    $ git config pre-commit.phpcs-encoding iso-8859-1

Disable ``jshint`` checking::

    $ git config pre-commit.jshint 0
