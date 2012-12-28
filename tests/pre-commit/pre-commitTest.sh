#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
    rm -rf "$SHUNIT_TMPDIR"
    mkdir -p "$SHUNIT_TMPDIR"

    cd "$SHUNIT_TMPDIR"
    git init -q
    ln -s "$TESTHOME/../../pre-commit/pre-commit" .git/hooks/
}

testFirstCommitClean()
{
    cp "$TESTHOME/../files/php-ok.php" "$SHUNIT_TMPDIR/"
    git add php-ok.php
    git commit -qm 'test commit'
    assertTrue "Clean commit should work" $?
}

testFirstCommitPhpError()
{
    cp "$TESTHOME/../files/php-syntax-error.php" "$SHUNIT_TMPDIR/"
    git add php-syntax-error.php
    git commit -qm 'test commit'
    assertFalse "Commit should fail because of PHP error" $?
}

testFirstCommitLinestyleError()
{
    cp "$TESTHOME/../files/linestyle-bom.txt" "$SHUNIT_TMPDIR/"
    git add linestyle-bom.txt
    git commit -qm 'test commit'
    assertFalse "Commit should fail because of linestyle error" $?
}

. shunit2
