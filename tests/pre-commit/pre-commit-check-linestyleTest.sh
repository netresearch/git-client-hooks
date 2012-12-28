#!/bin/sh
setUp()
{
    dir="`dirname "$0"`"
    fulldir="`readlink -f "$dir"`"
    cd "$fulldir"
}

testCatchBOM()
{
    ../../pre-commit/pre-commit-check-linestyle ../files/linestyle-bom.txt
    assertFalse $?
}

testCatchWindowsNewline()
{
    ../../pre-commit/pre-commit-check-linestyle\
         ../files/linestyle-windows.txt
    assertFalse $?
}

testCatchMacNewline()
{
    ../../pre-commit/pre-commit-check-linestyle\
         ../files/linestyle-mac.txt
    assertFalse $?
}

testAllFine()
{
    ../../pre-commit/pre-commit-check-linestyle\
         ../files/linestyle-unix.txt
    assertTrue $?
}

. shunit2
