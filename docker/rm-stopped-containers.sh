#!/bin/bash

function docker_remove_stopped_containers() {
        containers=($(docker ps -aq --no-trunc))

        # echo $containers
        # echo ${#containers[@]}

        if [ ${#containers[@]} -eq 0 ]; then
                echo "No exited containers found"
        else
                for i in $(docker ps -aq -f status=exited --no-trunc)
                do
                        docker rm $i
                done
        fi
}

docker_remove_stopped_containers
