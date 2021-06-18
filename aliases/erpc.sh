#!/bin/bash

export crenodispo_dir="$HOME/projects/creno-dispo"
export docker_compose_path="$crenodispo_dir/dev/docker-compose.dev.yml"

# crenodispo-cli
alias cre="crenodispo"
alias run-docker-compose="crenodispo restart-docker-compose"
alias run-batch-reprise="crenodispo run-batch-reprise"
alias mrc="crenodispo gitlab-mr --current"
alias mrs="crenodispo gitlab-mr --search"


alias ys="yarn start"


# "yarn install"
# "yarn build:dependencies"
alias build-fronts="yarn run concurrently \"cd packages/auto-ecole && yarn build\" \"cd packages/repartiteur && yarn build\""
alias run-fronts="yarn run concurrently \"cd packages/auto-ecole && yarn start:prod\" \"cd packages/repartiteur && yarn start:prod\""

alias build-and-run-candidat="yarn build && yarn start:prod"

api_dir="$crenodispo_dir/api"
alias run-tests="$api_dir/gradlew -p $api_dir test \
    --tests \"fr.gouv.interieur.creno_dispo.domain.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.use_cases.formation.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.use_cases.penalite.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.application.rest.penalite.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.penalite*\""

# alias run-tests="$api_dir/gradlew -p $api_dir test \
#     --tests \"fr.gouv.interieur.creno_dispo.application.rest.formation.creneau.*\""

