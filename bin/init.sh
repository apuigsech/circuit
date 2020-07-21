#!/bin/bash

set -x

BASE_PATH=$(realpath $(dirname $(realpath $0))/..)
for f in ${BASE_PATH}/lib/* ; do source $f; done

main() {
	minikube_start
	#kakfa_start
	#debezium_start
	#minio_start
	#argo_workflows_start
	#argo_workflows_config
	#argo_events_start
	#workflow_utils_build
	#workflow_utils_load
	models_build
}

minikube_stop
sleep 5s

main

minikube service list