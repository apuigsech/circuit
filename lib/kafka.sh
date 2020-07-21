#!/bin/bash

KAFKA_NAMESPACE="kafka"

kakfa_start() {
	kubectl create namespace ${KAFKA_NAMESPACE}
	kubectl apply -k github.com/Yolean/kubernetes-kafka/variants/dev-small/?ref=v6.0.3
}

kafka_stop() {
	kubectl delete namespace ${KAFKA_NAMESPACE}
}

kafka_restart() {
	kafka_stop
	sleep 5s
	kakfa_start
}