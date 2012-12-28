***********************************
Netresearch pre-commit hook for Git
***********************************


Features
========

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
  * Configuration file for Coding Standard, Path to PHPCS, Ignore List
* Shows output in a 'less' pipe following the smart git principles


Installation
============

* Put the script "pre-commit" into your .git/hooks directory
* OR: add the script to your pre-commit "chain"
  (you probably know what to do then)
* Put the Config file "config" into the same dir as the "pre-commit"
  script and edit it to your requirements
