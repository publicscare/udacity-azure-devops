SHELL := /bin/bash

VENV_DIR=$(HOME)/.$(shell basename $(CURDIR))

virtualenv:
	python3 -m venv $(VENV_DIR)

activate:
	source $(VENV_DIR)/bin/activate

versioninfo:
	python -m pip --version

hello:
	echo "Hello world!"
	
install:
	python3 -m venv $(VENV_DIR)
	source $(VENV_DIR)/bin/activate
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C,E1120,W0613 hello.py

flakeit:
	flake8 hello.py

reformat:
	black hello.py test_hello.py

test:
	python -m pytest test_hello.py

all: install lint test
