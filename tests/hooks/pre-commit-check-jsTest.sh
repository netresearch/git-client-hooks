#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testXmlSyntaxError()
{
    ../../hooks/pre-commit-check-js ../files/js-error.js
    assertFalse $?
}

testXmlOk()
{
    ../../hooks/pre-commit-check-js ../files/js-ok.js
    assertTrue $?
}

. shunit2
