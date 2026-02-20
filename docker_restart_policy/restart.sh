#!/usr/bin/env bash

DOCKER_IMAGE_NAME=''
CONTAINER_NAME=''
OPTION=''

# old (depracted hhh)
check_live()
{
  local output

  for (( i=0 ; i < 20; i++ ))
  do
    output=$(docker container ls | grep "${CONTAINER_NAME}")
    echo -ne "${output}\r"
    sleep 0.25
  done
}

check_status()
{
  local status
  status=$(docker inspect "${CONTAINER_NAME}" -f '{{.State.Status}}')
  echo -n "$status"
}

remove_container()
{
  {
    docker stop "${CONTAINER_NAME}"
    docker rm "${CONTAINER_NAME}" -f
  }  1> /dev/null
}

exit_container()
{
  # EXIT_CODE="$1"
  # echo "docker run -it --restart $OPTION --name $CONTAINER_NAME ${DOCKER_IMAGE_NAME} /start.sh $EXIT_CODE"
  # docker run -it --restart "$OPTION" --name "$CONTAINER_NAME" "${DOCKER_IMAGE_NAME}" /start.sh "$EXIT_CODE"
  # echo running "$@"
  # "$@"
  status=$(check_status)
  echo -n "=> status = $status"
 if [[ "$status" != 'exited' ]] 
 then
  echo "✅"
else
  echo "❌"
 fi
}

run()
{
  docker  run -it --restart "$OPTION" --name "$CONTAINER_NAME" "${DOCKER_IMAGE_NAME}" /start.sh 0
  sudo pkill dockerd
  echo 'sudo dockerd 1> /dev/null 2>/dev/null &'
  sudo dockerd  &
  sleep 1
  echo $?
  exit_container
  remove_container

  # exit_container 1
  # remove_container
}

main()
{
  DOCKER_IMAGE_NAME='test_restart_policy'
  echo "building ${DOCKER_IMAGE_NAME}" && docker build -t "$DOCKER_IMAGE_NAME" . 2> /dev/null
  if [[ $# -eq 1 ]]
  then
    if [[ "$1" == @(no|on-failure|always|unless-stopped) ]]
    then
      OPTION="$1"
      CONTAINER_NAME="${1}-restart${RANDOM}"
      run
    fi 
  else
    exit 1
  fi
}

main "$@"
