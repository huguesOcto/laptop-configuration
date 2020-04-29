# List directory contents
alias l='ls -lah'
alias ll='ls -lh'
alias d='dirs -v | head -10'

# Moving in directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

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

# Changing/making/removing directory stack
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias sz="source $ZDOTDIR/.zshrc"

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


# custom git functions
# function ticket_number() {
#     echo $(git_current_branch) | grep -o '^[0-9]\+'
# }

# function commit_message() {
#     echo "${1}"\($(ticket_number)\)": ${2}"
# }

# function gcamf() {
#     git commit -a -m "$(commit_message feat ${1})"
# }

# function gcamr() {
#     git commit -a -m "$(commit_message refactor ${1})"
# }

# function gcam-fix() {
#     git commit -a -m "$(commit_message fix ${1})"
# }

# function gcam-chore() {
#     git commit -a -m "$(commit_message chore ${1})"
# }

# function gcam-test() {
#     git commit -a -m "$(commit_message test ${1})"
# }

# function gcam-skip() {
#     git commit -a -m "[skip-ci] ${1}"
# }