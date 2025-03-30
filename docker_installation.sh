#!/bin/bash
<<helptext
This script is created to automate the installation process
helptext

function docker_installation(){
    ## Define error code
    E_NOTROOT=87 # Non-root exit error.

    ## check if is sudoer
    if ! $(sudo -l &> /dev/null); then
    echo 'Error: root privileges are needed to run this script'
    exit $E_NOTROOT
    fi

# updating the packages and installing dependencies
sudo apt-get update
sudo apt-get install -y

# Downloading Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    echo "Docker installation completed successfully"
}

function docker_compose_installation(){
  ## Define error code
    E_NOTROOT=87 # Non-root exit error.

    ## check if is sudoer
    if ! $(sudo -l &> /dev/null); then
    echo 'Error: root privileges are needed to run this script'
    exit $E_NOTROOT
    fi

    # Downloading Docker Compose
        # Downloading Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version

    echo "Docker Compose installation completed successfully"

}

docker_installation
docker_compose_installation