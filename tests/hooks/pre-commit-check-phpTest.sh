#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
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

testWhitespaceClosingPhpTag()
{
    ../../hooks/pre-commit-check-php\
        ../files/php-whitespace-closing-error.php
    assertFalse $?
}

testAllFine()
{
    ../../hooks/pre-commit-check-php\
        ../files/php-ok.php
    assertTrue $?
}

. shunit2
