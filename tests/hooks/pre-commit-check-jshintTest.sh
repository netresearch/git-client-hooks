#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testOk()
{
    ../../hooks/pre-commit-check-jshint ../files/jshint-ok.js
    assertTrue $?
}

testError()
{
    ../../hooks/pre-commit-check-jshint ../files/jshint-error.js
    assertFalse $?
}

. shunit2
