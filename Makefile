ROLE_NAMES := packages shell dev ops

.PHONY: help

help:
	@echo "make run 				Run bootstrap script and playbook."
	@echo "make lint				Lint all YAML files."
	@echo "make test-[$(ROLE_NAMES)]	Test a specific role from [$(ROLE_NAMES)]."
	@echo "make test 				Test the entire playbook."
	@echo "make help				Show help."

.PHONY: run

run: bootstrap ansible

bootstrap: bootstrap.sh
	sudo ./bootstrap.sh

ansible: playbook.yaml
	ansible-galaxy install -r requirements.yaml
	ansible-playbook playbook.yaml --syntax-check
	ansible-playbook -K playbook.yaml

.PHONY: lint

lint: .yamllint .ansible-lint
	yamllint .
	ansible-lint

.PHONY: test

test: ./molecule/default/
	molecule test

.PHONY: $(addprefix test-,$(ROLE_NAMES))

$(addprefix test-,$(ROLE_NAMES)):
	cd ./roles/$(subst test-,,$@) && molecule test && cd ../..
