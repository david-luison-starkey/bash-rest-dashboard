#!/usr/bin/env bash

get_content_length_header() {
	echo "Content-Length: ${1}"
}

get_http_headers() {
	local status_code="${1}"
	local content_length="${2}"
	local content_type="${3}"

	cat "${BASH_REST_DASHBOARD_RESPONSES_BASE_DIRECTORY}/${status_code}.txt"
	echo "Content-Length: ${content_length}"
	cat "${BASH_REST_DASHBOARD_CONTENT_TYPES_BASE_DIRECTORY}/${content_type}.txt"
}
