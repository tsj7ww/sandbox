# Each environment lives in env/<ENV>, mounted at /workspace alongside shared/ at /shared.
# Single-container envs are profiles in docker-compose.yml; envs with their own
# env/<ENV>/docker-compose.yml (airflow, superset) are run from that file.
#
#   make up ENV=cpp        or   make up-cpp

export ENV
OWN     := $(patsubst env/%/docker-compose.yml,%,$(wildcard env/*/docker-compose.yml))
ENVS    := $(sort $(OWN) $(shell ENV=_ docker compose config --profiles 2>/dev/null))
DC       = docker compose -p learn-$(ENV) $(if $(filter $(ENV),$(OWN)),-f env/$(ENV)/docker-compose.yml,--profile $(ENV))
ACTIONS := build up down restart logs shell clean

.DEFAULT_GOAL := help
.PHONY: help list ps down-all prune check $(ACTIONS)

help:
	@echo "usage:   make <action> ENV=<env>   (or make <action>-<env>)"
	@echo "actions: $(ACTIONS)"
	@echo "other:   list ps down-all prune"
	@echo "logs/shell take SVC=<service> for multi-service envs, e.g. make shell ENV=airflow SVC=airflow-webserver"

list: ; @printf '%s\n' $(ENVS)
ps:   ; @docker compose ls --filter name=learn-

$(ACTIONS): check
build:   ; $(DC) build
up:      ; $(DC) up -d --build
down:    ; $(DC) down
restart: ; $(DC) restart
logs:    ; $(DC) logs -f $(SVC)
shell:   ; $(DC) exec $(or $(SVC),$(ENV)) sh -c 'command -v bash >/dev/null && exec bash || exec sh'
clean:   ; $(DC) down --rmi local -v

check:
	@$(if $(filter $(ENV),$(ENVS)),:,echo "ENV must be one of: $(ENVS)"; exit 2)

down-all:
	@for p in $$(docker compose ls -q --filter name=learn-); do $(MAKE) -s down ENV=$${p#learn-}; done

prune:
	docker image prune -f
	docker builder prune -f

$(foreach a,$(ACTIONS),$(eval $(a)-%: ; @$$(MAKE) --no-print-directory $(a) ENV=$$*))
