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

function ddangling() {
  local dangling=$(docker images -qf dangling=true)
  if [ -n "$dangling" ]; then
    docker rmi $dangling
  fi
}

function dmanage() {
  local action=$1
  local container=$2

  if [ ! -f "$HOME/.docker/config/$container" ]; then
    echo "Unknown container $container"
    return 1
  fi

  . $HOME/.docker/config/$container

  if [ -n "$RESTART" ]; then
    RESTART="--restart $RESTART"
  fi

  case "$action" in
    pull)
      docker $DOCKER_OPTS pull $IMAGE
      ;;
    run)
      docker $DOCKER_OPTS run -d -t --name $NAME $RESTART $OPTS $IMAGE
      ;;
    start)
      docker $DOCKER_OPTS start $NAME
      ;;
    restart)
      docker $DOCKER_OPTS restart $NAME
      ;;
    stop)
      docker $DOCKER_OPTS stop $NAME
      ;;
    rmf)
      docker $DOCKER_OPTS rm -f $NAME
      ;;
    rmi)
      docker $DOCKER_OPTS rmi $IMAGE
      ;;
    logs)
      docker $DOCKER_OPTS logs -f $NAME
      ;;
    reload)
      dmanage rmf $container
      dmanage run $container
      ;;
    update)
      dmanage pull $container
      dmanage reload $container
      ;;
    *)
      echo "Unknown action $action"
      return 2
      ;;
  esac
}

function _dmanage() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  if [ $COMP_CWORD -eq 1 ]; then
    local options=( "pull run start restart stop rmf rmi logs reload update" )
  else
    IFS=$" "
    local options=( $(/bin/ls $HOME/.docker/config/) )
    unset IFS
  fi
  COMPREPLY=( $(compgen -W "${options[*]}" -- "$cur") )
}

if _is_bash; then
  complete -F __running_containers dip dssh dbash
  complete -F _dmanage dmanage
fi
