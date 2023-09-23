#!/usr/bin/env bash

# shellcheck disable=2002,2155

source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/modules/bash-rest/request_mapping.bash"
source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/src/utility/http-utility.bash"

@get_mapping "/components/header/header.js"
get_header_js() {
	local content_length=$(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/components/header/header.js" | wc -c)
	get_http_headers "200" "${content_length}" "text-javascript"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/components/header/header.js"
}
