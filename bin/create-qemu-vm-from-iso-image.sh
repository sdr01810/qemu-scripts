#!/bin/bash
## Create a QEMU VM by installing the OS from an ISO image file
##
## Arguments:
##
##     iso_image_file_pn [vm_disk_image_file_pn]
##
## Typical uses:
##
##     create-qemu-vm-from-iso-image ubuntu-20.04.1-desktop-amd64.iso
##
##     create-qemu-vm-from-iso-image ubuntu-20.04.1-desktop-amd64{.iso,.vm.disk.img}
##
## Bugs:
##
##     The target architecture on the ISO must match the qemu host architecture (for now).
##

source "$(dirname "${BASH_SOURCE:?}")"/thunk/qemu-scripts.prolog.sh

source create_qemu_vm_from_iso_image.functions.sh

##

function main() { # ...

	create_qemu_vm_from_iso_image "$@"
}

! [ "$0" = "${BASH_SOURCE}" ] || main "$@"
