#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testHtmlPartialError()
{
    ../../hooks/pre-commit-check-xml ../files/html-partial-error.htm
    assertFalse "$?"
}

testHtmlPartialOk()
{
    ../../hooks/pre-commit-check-xml ../files/html-partial-ok.htm
    assertTrue $?
}

testHtmlEntity()
{
    ../../hooks/pre-commit-check-xml ../files/html-entity.htm
    assertTrue $?
}

testHtmlUnclosedP()
{
    ../../hooks/pre-commit-check-xml ../files/html-unclosed-p.htm
    assertFalse $?
}

testHtmlFluidCdataOk()
{
    ../../hooks/pre-commit-check-xml ../files/html-fluid-cdata.htm
    assertTrue $?
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
