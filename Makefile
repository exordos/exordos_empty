SHELL := bash
REPOSITORY := https://repo.exordos.com
ifeq ($(SSH_KEY),)
	SSH_KEY = ~/.ssh/id_rsa.pub
endif

all: help

help:
	@echo "build            - build element"
	@echo "install          - install element"
	@echo "markdownlint     - lint markdown"
	@echo "docs     		- run docs"

markdownlint:
	markdownlint-cli2 --config .markdownlint.yaml "**/*.md" "#node_modules" --fix

docs:
	tox -e docs

build:
	exordos build -i $(SSH_KEY) -f

install:
	exordos elements install output/manifests/empty.yaml
