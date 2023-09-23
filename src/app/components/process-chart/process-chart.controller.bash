#!/usr/bin/env bash

# shellcheck disable=2002,2155

source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/modules/bash-rest/request_mapping.bash"
source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/src/utility/http-utility.bash"
source "${BASH_REST_DASHBOARD_PROJECT_BASE_DIRECTORY}/src/utility/controller-utility.bash"

@get_mapping "/components/process-chart/process-chart.js"
get_process_chart_js() {
	local content_length=$(cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/components/process-chart/process-chart.js" | wc -c)
	get_http_headers "200" "${content_length}" "text-javascript"
	cat "${BASH_REST_DASHBOARD_APP_BASE_DIRECTORY}/components/process-chart/process-chart.js"
}

@get_mapping "/process-chart/data/{processName}"
get_process_chart_data() {
	local process_name="${1}"
	process_name="$(decode_url "${process_name}")"
	process_name="$(sanitise_input "${process_name}")"

	local data=$(pgrep -fx "${process_name}" | head -n 1 |
		xargs -I {} bash -c 'pmap {}' |
		head -n -1 | tail -n +2 |
		tr -s ' ' | cut -d ' ' -f 2,4- |
		grep -v "total" |
		jq -R 'split(" ") | { "label": (.[1:] | join(" ")), "value": (.[0] | sub("K"; "")) }' |
		jq -s '.')
	local content_length=$(wc -c <<<"${data}")
	get_http_headers "200" "${content_length}" "json"
	echo "${data}"
}
