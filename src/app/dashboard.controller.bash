#!/usr/bin/env bash

# shellcheck disable=2002,2155

source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/src/utility/http-utility.bash"
source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/modules/bash-rest/request_mapping.bash"

@get_mapping "/dashboard"
get_dashboard_page() {
	local content_length=$(wc -c < <(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/dashboard.html"))
	get_http_headers "200" "${content_length}" "html"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/dashboard.html"
}

@get_mapping "/dashboard.js"
get_dashboard_js() {
	local content_length=$(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/dashboard.js" | wc -c)
	get_http_headers "200" "${content_length}" "text-javascript"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/dashboard.js"
}
