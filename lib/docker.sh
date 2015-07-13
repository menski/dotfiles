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

function __docker_images() {
  local images="$(__docker_q images -a --no-trunc | awk 'NR>1 { print $3; if ($1 != "<none>") { print $1; print $1":"$2 } }')"
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$images" -- "$cur") )
  __ltrim_colon_completions "$cur"
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

function dsh() {
  docker run -it --rm $1 /bin/bash -l
}

function dbash() {
  docker exec -it $1 /bin/bash -l
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

function __db_port() {
  case "$1" in
    mariadb)
      echo 3306
      ;;
    mysql)
      echo 3306
      ;;
    postgresql)
      echo 5432
      ;;
    db2)
      echo 50000
      ;;
    oracle)
      echo 1521
      ;;
    sqlserver)
      echo 1433
      ;;
  esac
}

function ddb() {
  local db=$1
  local tag=${2:latest}
  local db_port=$(__db_port $db)
  local image=camunda-ci1.local:5000/camunda-ci-${db}:${tag}
  local privileged=""
  __docker_q inspect $db
  if [ $? -eq 0 ]; then
    echo "deleting '$db' container"
    __docker_q rm -f -v $db
  fi
  if [ "$db" == "oracle" -o "$db" == "db2" ]; then
    privileged="--privileged"
  fi
  docker run -d -t --name $db -p $db_port:$db_port $privileged $image
}

function _ddb() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  if [ $COMP_CWORD -eq 1 ]; then
    local options=( "mariadb mysql postgresql oracle db2" )
  fi
  COMPREPLY=( $(compgen -W "${options[*]}" -- "$cur") )
}

if _is_bash; then
  complete -F __running_containers dip dssh dbash
  complete -F __docker_images dsh
  complete -F _dmanage dmanage
  complete -F _ddb ddb
fi
