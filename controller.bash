#!/usr/bin/env bash

source "./modules/bash-rest/request_mapping.bash"

@get_mapping "/api/v1/statistics"
get_system_statistics() {
	echo "Hello world"
}
