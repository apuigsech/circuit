#!/bin/bash

workflow_utils_build() {
	WORKFLOW_UTILS_PATH=${BASE_PATH}/utils/workflow-utils

	cd ${WORKFLOW_UTILS_PATH}/cmd/items-enrich && CGO_ENABLED="0" GOOS="linux" GOARCH=amd64 go build -o ${WORKFLOW_UTILS_PATH}/bin/items-enrich . && cd -

	eval $(minikube docker-env)
	for task_name in $(ls ${WORKFLOW_UTILS_PATH}/tasks) ; do
		docker build -f ${WORKFLOW_UTILS_PATH}/tasks/${task_name}/Dockerfile -t circuit/workflow-utils/tasks/${task_name}:lastest .
	done

	rm -rf ${WORKFLOW_UTILS_PATH}/bin/
}

workflow_utils_load() {
	kubectl apply -f ${WORKFLOW_UTILS_PATH}/templates/workflow-utils.yaml
}
