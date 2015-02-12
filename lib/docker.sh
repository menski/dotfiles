function __docker_q() {
  docker 2> /dev/null "$@"
}

function __running_containers() {
  local IFS=$'\n'
  local containers=( $(__docker_q ps -q) )
  local names=( $(__docker_q inspect --format '{{.Name}}' "${containers[@]}") )
  names=( "${names[@]#/}" ) # trim off the leading "/" from the container names
  unset IFS

  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "${names[*]} ${containers[*]}" -- "$cur") )
}

function dip() {
  __docker_q inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}

function dssh() {
  local username="$USER"
  if [ $# -gt 1 ]; then
    username="$1"
    shift
  fi
  local ip=$(dip $1)
  ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile=/dev/null' ${username}@${ip}
}

function dbash() {
  docker exec -it $1 /bin/bash
}

alias ddangling='docker rmi $(docker images -qf dangling=true)'

if _is_bash; then
  complete -F __running_containers dip dssh dbash
fi
