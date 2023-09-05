# Webcand IAC 
requirements:

# Nodejs
    Windows & Linux
    https://nodejs.org/en/download

# Docker
## Windows
    -> https://docs.docker.com/desktop/install/windows-install/
## linux
    -> https://docs.docker.com/desktop/install/linux-install/


# Download Webcand:
https://github.com/orgs/IPST-CNAM/repositories

## Infrastructure:
git clone https://github.com/IPST-CNAM/WebCand-IAC.git

## Frontend:
git clone https://github.com/IPST-CNAM/WebCand-Webclient.git

## Backend:
git clone https://github.com/IPST-CNAM/WebCand-API.git


# Install dependencies:

Open a Powershell or Open Shell into VsCode
## In Webclient & API folders:

npm install

## Launch the project:
in IAC folder:

[Windows]
docker compose up -d

[to Pierre and linux guys]
sudo docker compose up -d




/!\ please ensure docker is running on your machine! /!\ 
