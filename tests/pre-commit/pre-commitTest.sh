#!/bin/sh
dir="`dirname "$0"`"
TESTHOME="`readlink -f "$dir"`"

setUp()
{
    cd "$TESTHOME"
    rm -rf "$SHUNIT_TMPDIR"
    mkdir -p "$SHUNIT_TMPDIR"

    cd "$SHUNIT_TMPDIR"
    git init
    ln -s "$TESTHOME/../../pre-commit/pre-commit" .git/hooks/
}

testFirstCommitClean()
{
    cp "$TESTHOME/../files/php-ok.php" "$SHUNIT_TMPDIR/"
    git init
    git add php-ok.php
    git commit -m 'test commit'
    assertTrue "Clean commit should work" $?
}

testFirstCommitPhpError()
{
    cp "$TESTHOME/../files/php-syntax-error.php" "$SHUNIT_TMPDIR/"
    git add php-syntax-error.php
    git commit -m 'test commit'
    assertFalse "Commit should fail because of PHP error" $?
}

. shunit2
