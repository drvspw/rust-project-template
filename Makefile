BASEDIR = $(shell pwd)
CARGO = cargo

APPNAME = $(shell basename $(BASEDIR))
ifneq ($(APPNAME), {{crate_name}})
  APPNAME = {{crate_name}}
endif

LINTERS = clippy

clippy: ## clippy
	$(CARGO) clippy

build: $(LINTERS) ## compile
	$(CARGO) build

test: $(LINTERS) ## test
	RUST_LOG=debug $(CARGO) test -- --nocapture

{% if crate_type == "bin" %}
release: test ## release
	$(CARGO) build --release

run: $(LINTERS) ## run
	RUST_LOG=debug $(CARGO) run
{% endif %}

help: ## Display help information
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
