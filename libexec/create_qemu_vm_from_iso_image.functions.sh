##/bin/bash
## Provides function create_qemu_vm_from_iso_image() and friends.
## 

[ -z "$create_qemu_vm_from_iso_image_functions_p" ] || return 0

create_qemu_vm_from_iso_image_functions_p=t

create_qemu_vm_from_iso_image_debug_p=

##

source qemu_system.functions.sh

##

function create_qemu_vm_from_iso_image() { # iso_image_file_pn [vm_disk_image_file_pn]
## 
## Create a QEMU VM by installing the OS from an ISO image file
##
## Typical uses:
##
##    create_qemu_vm_from_iso_image ubuntu-20.04.1-desktop-amd64.iso
##
##    create_qemu_vm_from_iso_image ubuntu-20.04.1-desktop-amd64{.iso,.vm.disk.img}
##
## Bugs:
##
##    The target architecture on the ISO must match the QEMU host architecture (for now).
##
	local vm_memory="1g" # Ubuntu 20.04 needs more than 512m(?), so...

	local vm_disk_image_file_size_max="100g" # sparse file; grows on demand

	##

	local iso_image_file_pn="${1:?missing value for iso_image_file_pn}"
	shift 1

	local vm_disk_image_file_pn="${2:-${iso_image_file_pn%.*}.vm.disk.img}"
	[ $# -eq 0 ] || shift 1

	##

	xx qemu-img create "${vm_disk_image_file_pn:?}" "${vm_disk_image_file_size_max:?}"

	xx_qemu_system -enable-kvm -m "${vm_memory:?}" \
		-boot d -cdrom "${iso_image_file_pn:?}" -hda "${vm_disk_image_file_pn:?}"
}

function xx_create_qemu_vm_from_iso_image() { # ...

	create_qemu_vm_from_iso_image "$@"
}
