#!/usr/bin/env bash
eksctl delete nodegroup --name rossnodegroup --cluster basic-cluster
eksctl delete cluster --name basic-cluster --force
