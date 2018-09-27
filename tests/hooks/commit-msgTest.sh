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

    cat > .git/hooks/commit-msg << EOF
#!/bin/sh
# Require a ticket number

# call commit-msg-require-ticket-number client hook directly (see NRTECH-1821)
${TESTHOME}/../../hooks/commit-msg-require-ticket-number \$@
EOF
    chmod +x .git/hooks/commit-msg
}

testJiraTicket()
{
    cp "$TESTHOME/../files/php-ok.php" "$SHUNIT_TMPDIR/"
    git add php-ok.php
    git commit -qm 'UNITTEST-123: test commit'
    assertTrue "Commit message has ticket number, all fine" $?
}

testTypo3OrgTicketFixes()
{
    cp "$TESTHOME/../files/php-ok.php" "$SHUNIT_TMPDIR/"
    git add php-ok.php
    git commit -qm "[BUGFIX] test commit
Fixes: #12345"
    assertTrue "Commit message has typo3.org 'Fixes' ticket number" $?
}

testTypo3OrgTicketResolves()
{
    cp "$TESTHOME/../files/php-ok.php" "$SHUNIT_TMPDIR/"
    git add php-ok.php
    git commit -qm "[BUGFIX] test commit
Resolves: #12345"
    assertTrue "Commit message has typo3.org 'Resolves' ticket number" $?
}

testNoTicket()
{
    cp "$TESTHOME/../files/php-ok.php" "$SHUNIT_TMPDIR/"
    git add php-ok.php
    git commit -qm 'test commit'
    assertFalse "Missing ticket number should prevent commit" $?
}

. shunit2
