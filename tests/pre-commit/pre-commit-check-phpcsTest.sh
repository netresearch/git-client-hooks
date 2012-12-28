#!/bin/sh
setUp()
{
    dir="`dirname "$0"`"
    fulldir="`readlink -f "$dir"`"
    cd "$fulldir"
}

testOk()
{
    ../../pre-commit/pre-commit-check-phpcs ../files/php-ok.php
    assertTrue $?
}

testError()
{
    ../../pre-commit/pre-commit-check-phpcs ../files/phpcs-error.php
    assertFalse $?
}

testWarningIgnored()
{
    ../../pre-commit/pre-commit-check-phpcs ../files/phpcs-warning.php
    assertTrue "Warnings should be ignored by default" $?
}

. shunit2
