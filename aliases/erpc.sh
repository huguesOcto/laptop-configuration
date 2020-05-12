#!/bin/bash

crenodispo_dir="$HOME/projects/creno-dispo"

alias docker-up="docker-compose -f $crenodispo_dir/dev/docker-compose.dev.yml up"
alias docker-down="docker-compose -f $crenodispo_dir/dev/docker-compose.dev.yml down"
alias run-docker-compose="docker-down && docker-up --build"

alias fake-smtp="java -jar $crenodispo_dir/fakeSMTP-2.0.jar  -o ~/Desktop/creno_dispo/smtp_output"

# Gatling aliases for ERPC
alias gatling-editeur-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatEditeurSimulation"
alias gatling-front-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatFrontSimulation"


alias build-batch-reprise="docker build -t batch-reprise $crenodispo_dir/batch_reprise"
alias run-batch-reprise="build-batch-reprise && \
            docker run --rm --network=dev_default \
            --env-file $crenodispo_dir/batch_reprise/env/datasource.env \
            batch-reprise \
            default"

# function run-tests() {
#     cd $crenodispo_dir/api
#     ./gradlew test \
#         --tests "fr.gouv.interieur.creno_dispo.domain.*" \
#         --tests "fr.gouv.interieur.creno_dispo.application.rest.dsr.candidat.*" \
#         --tests "fr.gouv.interieur.creno_dispo.application.rest.dsr.examen.*" \
#         --tests "fr.gouv.interieur.creno_dispo.infrastructure.database.candidat*" \
#         --tests "fr.gouv.interieur.creno_dispo.infrastructure.database.creneau.*" \
#         --tests "fr.gouv.interieur.creno_dispo.infrastructure.database.centre.*"

#     cd -
# }

alias run-tests="./gradlew test \
    --tests \"fr.gouv.interieur.creno_dispo.domain.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.application.rest.dsr.candidat.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.application.rest.dsr.examen.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.candidat*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.creneau.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.centre.*\""

