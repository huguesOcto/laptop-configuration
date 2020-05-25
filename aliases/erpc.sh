#!/bin/bash

export crenodispo_dir="$HOME/projects/creno-dispo"
export docker_compose_path="$crenodispo_dir/dev/docker-compose.dev.yml"

alias docker-up="docker-compose -f $docker_compose_path up"
alias docker-down="docker-compose -f $docker_compose_path down"
alias run-docker-compose="docker-down && docker-up --build"

alias fake-smtp="java -jar $crenodispo_dir/fakeSMTP-2.0.jar  -o ~/Desktop/creno_dispo/smtp_output"


alias gatling-editeur-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatEditeurSimulation"
alias gatling-front-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatFrontSimulation"


alias build-batch-reprise="docker build -t batch-reprise $crenodispo_dir/batch_reprise"
alias run-batch-reprise="build-batch-reprise && \
            docker run --rm --network=dev_default \
            --env-file $crenodispo_dir/batch_reprise/env/datasource.env \
            batch-reprise \
            default"


api_dir="$crenodispo_dir/api"
alias run-tests="$api_dir/gradlew -p $api_dir test \
    --tests \"fr.gouv.interieur.creno_dispo.domain.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.use_cases.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.application.rest.dsr.examen.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.creneau*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.examen*\""

