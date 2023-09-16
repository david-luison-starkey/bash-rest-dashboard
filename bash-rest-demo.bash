#!/usr/bin/env bash

# shellcheck disable=2155

declare -gx BASH_REST_DEMO_PROJECT_BASE_DIRECTORY="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

bash ./modules/bash-rest/bash-rest.bash "${BASH_REST_DEMO_PROJECT_BASE_DIRECTORY}/controller.bash"
