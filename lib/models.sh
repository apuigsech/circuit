#!/bin/bash

models_build() {
	MODELS_PATH=${BASE_PATH}/models

	eval $(minikube docker-env)
	for model_name in $(ls ${MODELS_PATH}) ; do
		cd ${MODELS_PATH}/${model_name} && CGO_ENABLED="0" GOOS="linux" GOARCH=amd64 go build -o bin/${model_name} . && cd -
		#docker build -f ${WORKFLOW_UTILS_PATH}/tasks/${task_name}/Dockerfile -t circuit/workflow-utils/tasks/${task_name}:lastest .
	done
}