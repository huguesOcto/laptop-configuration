#!/bin/bash

export crenodispo_dir="$HOME/projects/creno-dispo"
export docker_compose_path="$crenodispo_dir/dev/docker-compose.dev.yml"

# crenodispo-cli
alias cre="crenodispo"
alias run-docker-compose="crenodispo restart-docker-compose"
alias run-batch-reprise="crenodispo run-batch-reprise"
alias mrc="crenodispo gitlab-mr --current"
alias mrs="crenodispo gitlab-mr --search"


alias fake-smtp="java -jar $crenodispo_dir/fakeSMTP-2.0.jar  -o ~/Desktop/creno_dispo/smtp_output"
alias gatling-editeur-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatEditeurSimulation"
alias gatling-front-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatFrontSimulation"


api_dir="$crenodispo_dir/api"
# alias run-tests="$api_dir/gradlew -p $api_dir test \
#     --tests \"fr.gouv.interieur.creno_dispo.domain.*\" \
#     --tests \"fr.gouv.interieur.creno_dispo.use_cases.dsr.*\" \
#     --tests \"fr.gouv.interieur.creno_dispo.application.rest.dsr.*\" \
#     --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.creneau*\" \
#     --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.examen*\""

alias run-tests="$api_dir/gradlew -p $api_dir test \
    --tests \"fr.gouv.interieur.creno_dispo.application.rest.formation.creneau.*\""

