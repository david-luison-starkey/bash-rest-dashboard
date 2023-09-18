#!/usr/bin/env bash

bash_rest_404_not_found() {
	cat "${BASH_REST_DASHBOARD_RESPONSES_BASE_DIRECTORY}/404.txt"
	cat "${BASH_REST_DASHBOARD_CONTENT_TYPES_BASE_DIRECTORY}/html.txt"
	cat "${BASH_REST_DASHBOARD_PAGES_BASE_DIRECTORY}/not_found.html"
}
