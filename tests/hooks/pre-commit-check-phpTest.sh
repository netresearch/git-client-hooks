#!/bin/sh
setUp()
{
    dir="`dirname "$0"`"
    fulldir="`readlink -f "$dir"`"
    cd "$fulldir"
}

testSyntaxError()
{
    ../../hooks/pre-commit-check-php ../files/php-syntax-error.php
    assertFalse $?
}

testVarDump()
{
    ../../hooks/pre-commit-check-php ../files/php-var_dump.php
    assertFalse $?
}

testPrintR()
{
    ../../hooks/pre-commit-check-php ../files/php-print_r.php
    assertFalse $?
}

testDebugPrintBacktrace()
{
    ../../hooks/pre-commit-check-php\
        ../files/php-debug_print_backtrace.php
    assertFalse $?
}

testAllFine()
{
    ../../hooks/pre-commit-check-php\
        ../files/php-ok.php
    assertTrue $?
}

. shunit2
