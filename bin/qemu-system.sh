#!/bin/bash
## Launches the correct qemu-system variant based on `uname -m`
##
## Handy argument sets:
##
## -chardev stdio,mux=on,id=char0
## -mon chardev=char0,mode=readline
## -serial chardev:char0
## -serial chardev:char0
##

source "$(dirname "${BASH_SOURCE:?}")"/thunk/qemu-scripts.prolog.sh

source qemu_system.functions.sh

##

function main() { # ...

	qemu_system "$@"
}

! [ "$0" = "${BASH_SOURCE}" ] || main "$@"
