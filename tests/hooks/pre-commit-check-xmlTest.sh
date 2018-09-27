#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testXmlSyntaxError()
{
    ../../hooks/pre-commit-check-xml ../files/xml-syntax-error.xml
    assertFalse $?
}

testXmlFine()
{
    ../../hooks/pre-commit-check-xml ../files/xml-ok.xml
    assertTrue $?
}

. shunit2
