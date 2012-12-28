#!/bin/sh
setUp()
{
    dir="`dirname "$0"`"
    fulldir="`readlink -f "$dir"`"
    cd "$fulldir"
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
