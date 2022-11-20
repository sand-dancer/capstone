## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.capstone/bin/activate
	python3 -m venv ~/.capstone

install:
	# This should be run from inside a virtualenv
	#pip3 install --upgrade pip &&\
	#	pip3 install -r requirements.txt
	#ARCHFLAGS="-arch x86_64" pip3 install --upgrade --no-binary pip3 setuptools wheel --use-pep517 &&\
	#	ARCHFLAGS="-arch x86_64" pip3 install -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Darwin-x86_64
	chmod +x ./hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

build:
	docker build --tag=jarmanr/capstone .
	docker image ls
	docker login -u $DOCKER_USERNAME -p $DOCKER_ACCSS_CODE
	docker push jarmanr/capstone

check-eksctl:
	eksctl get cluster

create-cluster:
	eksctl create cluster -f cluster_config.yaml

deploy-to-cluster:
	kubectl create deploy rosscapstonecluster --image=jarmanr/capstone:latest

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	#pylint --disable=R,C,W1203,W1202 app.py

all: install lint test

