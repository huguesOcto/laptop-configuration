#!/bin/sh

alias vim="vim -i NONE"
alias git='LANG=en_US.UTF-8 git' # otherwise it's in French
ls -G . &>/dev/null && alias ls='ls -G' # Works on mac but not on linux

# List directory contents
alias l='ls -lah'
alias ll='ls -lh'
alias d='dirs -v | head -10'

# Moving in directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias sz='source $ZDOTDIR/.zshrc'

# aliases for ERPC
alias docker-up="docker-compose -f dev/docker-compose.dev.yml up"
alias docker-down="docker-compose -f dev/docker-compose.dev.yml down"
alias run-docker-compose="docker-down && docker-up --build"

alias fake-smtp="java -jar ~/Desktop/creno_dispo/fakeSMTP-2.0.jar  -o ~/Desktop/creno_dispo/smtp_output"

# Gatling aliases for ERPC
alias gatling-editeur-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatEditeurSimulation"
alias gatling-front-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatFrontSimulation"


alias build-batch-reprise="docker build -t batch-reprise ~/projects/creno-dispo/batch_reprise"
alias run-batch-reprise="build-batch-reprise && \
            docker run --rm --network=dev_default \
            --env-file ~/projects/creno-dispo/batch_reprise/env/datasource.env \
            batch-reprise \
            default"



alias run-tests="./gradlew test \
    --tests \"fr.gouv.interieur.creno_dispo.domain.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.application.rest.dsr.candidat.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.candidat*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.creneau.*\" \
    --tests \"fr.gouv.interieur.creno_dispo.infrastructure.database.centre.*\""


