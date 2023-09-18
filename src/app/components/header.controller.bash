#!/usr/bin/env bash

# shellcheck disable=2002

source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/modules/bash-rest/request_mapping.bash"
source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/src/utility/http-utility.bash"

@get_mapping "/api/v1/components/header.js"
get_header_js() {
	local content_length
	content_length=$(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/components/header.js" | wc -c)
	cat "${BASH_REST_DASHBOARD_RESPONSES_BASE_DIRECTORY}/200.txt"
	echo "Content-Length: ${content_length}"
	cat "${BASH_REST_DASHBOARD_CONTENT_TYPES_BASE_DIRECTORY}/javascript.txt"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/components/header.js"
}
