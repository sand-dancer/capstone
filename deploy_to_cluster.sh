#!/usr/bin/env bash

# Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl create deploy rosscapstonecluster --image=jarmanr/capstone:latest
