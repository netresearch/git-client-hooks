#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
}

testCatchBOM()
{
    ../../hooks/pre-commit-check-linestyle ../files/linestyle-bom.txt
    assertFalse $?
}

testCatchWindowsNewline()
{
    ../../hooks/pre-commit-check-linestyle\
         ../files/linestyle-windows.txt
    assertFalse $?
}

testCatchMacNewline()
{
    ../../hooks/pre-commit-check-linestyle\
         ../files/linestyle-mac.txt
    assertFalse $?
}

testAllFine()
{
    ../../hooks/pre-commit-check-linestyle\
         ../files/linestyle-unix.txt
    assertTrue $?
}

. shunit2
