#!/usr/bin/env bash

# shellcheck disable=2002,2155

source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/src/utility/http-utility.bash"
source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/modules/bash-rest/request_mapping.bash"

@get_mapping "/api/v1/home"
get_app_page() {
	local content_length=$(wc -c < <(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/app.html"))
	get_http_headers "200" "${content_length}" "html"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/app.html"
}

@get_mapping "/api/v1/app.js"
get_app_js() {
	local content_length=$(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/app.js" | wc -c)
	get_http_headers "200" "${content_length}" "text-javascript"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/app.js"
}
