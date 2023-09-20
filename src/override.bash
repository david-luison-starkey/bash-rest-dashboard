#!/usr/bin/env bash

# shellcheck disable=2002,2155

bash_rest_404_not_found() {
	local content_length=$(cat "${BASH_REST_DASHBOARD_PAGES_BASE_DIRECTORY}/not_found.html" | wc -c)
	get_http_headers "404" "${content_length}" "html"
	cat "${BASH_REST_DASHBOARD_PAGES_BASE_DIRECTORY}/not_found.html"
}
