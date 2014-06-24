#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testXmlSyntaxError()
{
    ../../hooks/pre-commit-check-json ../files/json-error.json
    assertFalse $?
}

testXmlOk()
{
    ../../hooks/pre-commit-check-json ../files/json-ok.json
    assertTrue $?
}

. shunit2
