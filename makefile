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
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C mylib cli scli

flakeit:
	flake8 mylib

reformat:
	black cli.py mylib/lib.py


test:
#	python -m pytest --vv --cov=mylib --cov=cli --cov=scli tests/*.py
	python -m pytest test_hello.py

all: install flakeit lint test
