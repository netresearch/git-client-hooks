#!/bin/sh
# Creates a system-wide git alias "git setup-hooks"

dir="`dirname "$0"`"
HOOKSDIR="`readlink -f "$dir"`/hooks"
git config --system alias.setup-hooks '!cd "`git rev-parse --git-dir`/hooks" && ln -fs $HOOKSDIR/commit-msg && ln -fs $HOOKSDIR/pre-commit; cd -'

echo "You may now run
 $ git setup-hooks
in each git directory to setup the hooks for it."
