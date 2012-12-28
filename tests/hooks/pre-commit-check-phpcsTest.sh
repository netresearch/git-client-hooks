#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testOk()
{
    ../../hooks/pre-commit-check-phpcs ../files/php-ok.php
    assertTrue $?
}

testError()
{
    ../../hooks/pre-commit-check-phpcs ../files/phpcs-error.php
    assertFalse $?
}

testWarningIgnored()
{
    ../../hooks/pre-commit-check-phpcs ../files/phpcs-warning.php
    assertTrue "Warnings should be ignored by default" $?
}

. shunit2
