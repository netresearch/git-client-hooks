#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testHtmlPartialError()
{
    ../../hooks/pre-commit-check-html5 ../files/html-partial-error.htm
    assertFalse "$?"
}

testHtmlPartialOk()
{
    ../../hooks/pre-commit-check-html5 ../files/html-partial-ok.htm
    assertTrue $?
}

testHtmlEntity()
{
    ../../hooks/pre-commit-check-html5 ../files/html-entity.htm
    assertTrue $?
}

testHtmlUnclosedP()
{
    ../../hooks/pre-commit-check-html5 ../files/html-unclosed-p.htm
    assertFalse $?
}

testHtmlFluidCdataOk()
{
    ../../hooks/pre-commit-check-html5 ../files/html-fluid-cdata.htm
    assertTrue $?
}

testHtmlFluidDebug()
{
    ../../hooks/pre-commit-check-html5 ../files/html-fluid-debug.htm
    assertFalse $?
}

testHtmlFluidDebugInline()
{
    ../../hooks/pre-commit-check-html5 ../files/html-fluid-debug-inline.htm
    assertFalse $?
}

. shunit2
