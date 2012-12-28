#!/bin/sh
setUp()
{
    dir="`dirname "$0"`"
    fulldir="`readlink -f "$dir"`"
    cd "$fulldir"
}

testSyntaxError()
{
    ../../pre-commit/pre-commit-check-php ../files/php-syntax-error.php
    assertFalse $?
}

testVarDump()
{
    ../../pre-commit/pre-commit-check-php ../files/php-var_dump.php
    assertFalse $?
}

testPrintR()
{
    ../../pre-commit/pre-commit-check-php ../files/php-print_r.php
    assertFalse $?
}

testDebugPrintBacktrace()
{
    ../../pre-commit/pre-commit-check-php\
        ../files/php-debug_print_backtrace.php
    assertFalse $?
}

testAllFine()
{
    ../../pre-commit/pre-commit-check-php\
        ../files/php-ok.php
    assertTrue $?
}

. shunit2
