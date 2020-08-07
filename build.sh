#!/usr/bin/env bash

# Env Vars for SSH.
source /root/.ssh/agent/root || . /root/.ssh/agent/root

# Log file
log="/home/docker/curl_docker_image/log.build"


# Generate timestamp
timestamp () {
    date +"%Y%m%d_%H%M%S"
}


# Log and Print
logger () {
    printf "$(timestamp) - $1\n" | tee -a $log
}


# Exception Catcher
except () {
    logger $1
    return 1
}


# Assign timestamp to ensure var is a static point in time.
timestp=$(timestamp)
logger "Starting Build.\n"


# Build the image using timestamp as tag.
if /usr/bin/docker build /home/docker/curl_docker_image -t docker.io/blairy/curl:$timestp | tee -a $log; then
    logger "Build completed successfully.\n\n"
else
    logger "Build FAILED!! Aborting.\n\n"
    exit 1
fi



# Push to github - Triggers builds in github and Dockerhub.
# TODO: Make this a function and add better exception management.. 
# only run this if the SSH function is successful.
git () {
    git="/usr/bin/git -C /home/docker/curl_docker_image"
    $git pull git@github.com:blairjames/curl_docker_image.git | tee -a $log || except "git pull failed!"
    $git add --all | tee -a $log || except "git add failed!"
    $git commit -a -m 'Automatic build '$timestp | tee -a $log || except "git commit failed!"
    $git push | tee -a $log || except "git push failed!"
}


# Run the git transactions
if git; then
    logger "git completed successfully." 
else
    logger "git failed!!" 
fi


# Push the new tag to Dockerhub.
if docker push blairy/curl:$timestp | tee -a $log; then 
    logger "Docker push completed successfully.\n\n"
else
    logger "Docker push FAILED!!\n\n"
    exit 1 
fi


# All completed successfully
logger "All completed successfully"
