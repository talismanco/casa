# MAKEFILE
#
# @author      Sam Craig <sam@talisman.dev>
# @link        https://github.com/talismanco/casa
# ------------------------------------------------------------------------------

.EXPORT_ALL_VARIABLES:

# Display general help about this command
.PHONY: help
help:
	@echo ""
	@echo "$(PROJECT) Makefile."
	@echo ""
	@echo "The following commands are available:"
	@echo ""
	@echo "    make init       : Initialize casa"
	@echo ""
	@echo "    make update     : Update all project dependencies"
	@echo "    make update-nix : Update niv dependencies"
	@echo "    make update-npm : Update npm dependencies"
	@echo ""

all: help

# === Entities ===

# URL of the remote repository
REPOSITORY := $$PROJECT_REPOSITORY

# Project owner
OWNER := $$PROJECT_OWNER

# Project name
PROJECT := $$PROJECT_NAME

# Project version
VERSION := $$PROJECT_VERSION

# Project commit hash
COMMIT := $(shell git rev-parse HEAD)

# Project vendor
VENDOR := $(NAME)-vendor

# Name of RPM or DEB package
PKGNAME := $(VENDOR)-$(NAME)

# === Shell Configuration ===

SHELL := $(shell which bash)

UNAME_OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
UNAME_ARCH := $(shell uname -m | tr '[:upper:]' '[:lower:]')

TMP_BASE := vendor
TMP := $(TMP_BASE)
TMP_BIN = $(TMP)/bin
TMP_VERSIONS := $(TMP)/versions

# === Environment ===

STAGE ?= development

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CONFIG_DIR := $(ROOT_DIR)/config
SETTINGS_DIR := $(CONFIG_DIR)/settings
TARGET_DIR := $(ROOT_DIR)/target

# Combine the active project stage configuration settings
# with the included `global.json` configuartion settings.
STAGE_SETTINGS := $(SETTINGS_DIR)/$(STAGE).json
GLOBAL_SETTINGS := $(SETTINGS_DIR)/global.json

export PATH := $(PATH):$(TARGET_DIR)

.PHONY: .env.json
.env.json:
	@jq -s '.[0] * .[1]' $(STAGE_SETTINGS) $(GLOBAL_SETTINGS) > .env.json

# Export `.tool-versions` entries as environment variables
# with the pattern "<DEPENDENCY_NAME>_VERSION=<DEPENDENCY_VERSION>"
# to the temp file `.tool-versiions.env`
include .tool-versions.env
.PHONY: .tool-versions.env
.tool-versions.env: .tool-versions
	@(sed -e 's/\(.*\)\ \(.*\)/\1_VERSION=\2/g' | tr '[:lower:]' '[:upper:]') < $< > $@

include .env
.PHONY: .env
.env: .env.json
	@(python ./scripts/python/jsontoenv.py) < $< > $@

.PHONY: .env.yaml
.env.yaml: .env.json
	@(python ./scripts/python/jsontoyaml.py) < $< > $@

# === Init ===

# Initialize casa
.PHONY: init
init:
	@. ./scripts/bash/init.sh

# === Update ===

# Update all project dependencies
.PHONY: update
update:
	@$(MAKE) -s update-niv
	@$(MAKE) -s update-npm	

# Update niv dependencies
.PHONY: update-niv
update-niv:
	@niv update

# Update npm packages
.PHONY: update-npm
update-npm:
	@npm run update && \
		npm install
