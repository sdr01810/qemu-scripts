##/bin/bash
## Provides function qemu_system() and friends.
## 

[ -z "$qemu_system_functions_p" ] || return 0

qemu_system_functions_p=t

qemu_system_debug_p=

##

source qemu_arch.functions.sh

source xx.functions.sh

##

function qemu_system() { # ...
## 
## Launches the correct qemu-system variant based on `uname -m`.
##
	local qemu_arch="$(as_qemu_arch `uname -m`)"

	local qemu_args=( "$@" )
        shift $#

	if ! is_supported_qemu_system_arch "${qemu_arch}" ; then

		echo 1>&2 "${this_script_fbn:?}: unsupported/uninstalled QEMU system architecture: ${qemu_arch:?}"
		return 2
	fi

	xx "qemu-system-${qemu_arch:?}" "${qemu_args[@]}"
}

function xx_qemu_system() { # ...

	qemu_system "$@"
}
