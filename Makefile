# Makefile for flutter operations

.PHONY: help freezed

help: ## This help message
	@echo "Usage: make [<TARGET>:]\n"
	@printf "%-30s\033[0m %s\n" "TARGET" "DESCRIPTION"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

codegen: ## Run the code generation for the project
	dart run build_runner build --delete-conflicting-outputs

codegen_watch: ## Run the code generation for the project in watch mode
	dart run build_runner watch --delete-conflicting-outputs