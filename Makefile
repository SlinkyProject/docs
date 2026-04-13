# Minimal makefile for Sphinx documentation
#

# CONTAINER_TOOL defines the container tool to be used for building images.
# Be aware that the target commands are only tested with Docker which is
# scaffolded by default. However, you might want to replace it to use other
# tools. (i.e. podman)
CONTAINER_TOOL ?= docker

REGISTRY ?= slinky.slurm.net
DOCS_IMAGE ?= $(REGISTRY)/sphinx

# Setting SHELL to bash allows bash commands to be executed by recipes.
# Options are set to exit when a recipe line exits non-zero or a piped command fails.
SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec

## Location to install dependencies to
LOCALBIN ?= $(shell pwd)/bin
$(LOCALBIN):
	mkdir -p $(LOCALBIN)

##@ General

# Default target: summarize this Makefile (variables are not expanded in awk output).
help: ## Show targets, overridable variables, and local HTML output location
	@echo 'Slinky docs — common targets:'
	@echo ''
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9][a-zA-Z0-9_-]*:.*?##/ { printf "  %-22s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo ''
	@echo 'Override on the command line, for example: make REGISTRY=my.registry run-docs'
	@echo '  CONTAINER_TOOL=$(CONTAINER_TOOL)'
	@echo '  REGISTRY=$(REGISTRY)'
	@echo '  DOCS_IMAGE=$(DOCS_IMAGE)'
	@echo '  LOCALBIN=$(LOCALBIN)'
	@echo '  LOCALBUILD=$(LOCALBUILD)'
	@echo ''
	@echo 'Local HTML (after sphinx-build): $(LOCALBUILD)/html/index.html'

.PHONY: help Makefile

##@ Build

.PHONY: all
all: run-docs

.PHONY: build-docs
build-docs: ## Build the container image used to develop the docs
	$(CONTAINER_TOOL) build -t $(DOCS_IMAGE) .

.PHONY: run-docs
run-docs: build-docs ## Run the container image for docs development
	$(CONTAINER_TOOL) run --rm --network host -v ./docs:/docs:z $(DOCS_IMAGE) sphinx-autobuild --port 8000 /docs /build/html

## Location to locally build documentation
LOCALBUILD ?= $(shell pwd)/build-docs
$(LOCALBUILD):
	mkdir -p $(LOCALBUILD)

.PHONY: sphinx-build
sphinx-build: sphinx-install $(LOCALBIN) $(LOCALBUILD) ## Build HTML under LOCALBUILD using a local Python venv
	source $(LOCALBIN)/sphinx-venv/bin/activate ;\
	sphinx-build -M html docs $(LOCALBUILD) ;\
	deactivate ;\

.PHONY: sphinx-install
sphinx-install: sphinx-venv ## Install requirements.txt into the Sphinx venv
	source $(LOCALBIN)/sphinx-venv/bin/activate ;\
	pip install -r requirements.txt ;\
	deactivate ;\

.PHONY: sphinx-venv
sphinx-venv: $(LOCALBIN) ## Create LOCALBIN/sphinx-venv for local doc builds
	python3 -m venv $(LOCALBIN)/sphinx-venv
