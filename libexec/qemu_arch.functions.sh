##/bin/bash
## Provides utility functions for working with QEMU target architecture monikers.
## 

[ -z "$qemu_arch_functions_p" ] || return 0

qemu_arch_functions_p=t

qemu_arch_debug_p=

##

function as_qemu_arch() { # architecture_moniker

	local arch="${1:?missing value for architecture_moniker}"

	local result

	case "${arch:?}" in
	x86_32|x86|i[3456]86])
		result="i386"
		;;
	x86_64|amd64)
		result="x86_64"
		;;
	*)
		result="${arch:?}"
		;;
	esac

	echo "${result:?}"
}

function is_supported_qemu_system_arch() { # architecture_moniker

	local arch="${1:?missing value for architecture_moniker}"

        list_architectures_supported_by_qemu_system_on_this_host |

	fgrep -q -x "${arch:?}"
}

function list_architectures_supported_by_qemu_system_on_this_host() {

        ls /usr/bin/qemu-system-* 2>&- |
	#^-- TODO: allow qemu-system-* to be installed anywhere

	perl -pe 's#^.*/qemu-system-##'
}

