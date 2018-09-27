#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testHtmlOk1()
{
    ../../hooks/pre-commit-check-html5 ../files/ok1.html
    assertTrue "$?"
}

testHtmlOk2()
{
    ../../hooks/pre-commit-check-html5 ../files/ok2.html
    assertTrue "$?"
}

testHtmlOk3()
{
    ../../hooks/pre-commit-check-html5 ../files/ok3.html
    assertTrue "$?"
}

testHtmlNotOk1()
{
    ../../hooks/pre-commit-check-html5 ../files/not-ok1.html
    assertFalse "$?"
}

testHtmlNotOk2()
{
    ../../hooks/pre-commit-check-html5 ../files/not-ok2.html
    assertFalse "$?"
}

testHtmlNotOk3()
{
    ../../hooks/pre-commit-check-html5 ../files/not-ok3.html
    assertFalse "$?"
}

. shunit2
