#!/usr/bin/env bash

# shellcheck disable=2086,2162

sanitise_input() {
	local input="${1}"
	input="${input//[^- \/a-zA-Z0-9]/}"
	input="${input//exec/}"
	input="${input//eval/}"
	echo "${input}"
}

# https://www.baeldung.com/linux/decoding-encoded-urls
decode_url() {
	local encoded="${1}"
	(
		IFS="+"
		read _z
		echo -e ${_z//%/\\x}""
	) <<<"${encoded}"
}
