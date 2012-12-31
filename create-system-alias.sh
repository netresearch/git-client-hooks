#!/bin/sh
# Creates a system-wide git alias "git hooksetup"

dir="`dirname "$0"`"
HOOKSDIR="`readlink -f "$dir"`/hooks"
git config --system alias.hooksetup '!cd "`git rev-parse --git-dir`/hooks" && ln -fs $HOOKSDIR/commit-msg && ln -fs $HOOKSDIR/pre-commit; cd -'

echo "You may now run
 $ git hooksetup
in each git directory to setup the hooks for it."
