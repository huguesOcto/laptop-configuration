#!/bin/sh

# List directory contents
alias l='ls -lah'
alias ll='ls -lh'
alias d='dirs -v | head -10'

# Moving in directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# move to directory
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'


alias vim="vim -i NONE"
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
