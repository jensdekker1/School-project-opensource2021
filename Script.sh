#!/bin/sh
echo "Wil je verder gaan? (Ja/nee)"
read input 
if [ "$input" == "Ja" ]
then
echo "Installatie gaat beginnen"
apt-get update
apt-get upgrade 
apt-get install curl 
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m$
sudo chmod +x /usr/local/bin/docker-compose
mkdir ./scripts
git clone https://github.com/jensdekker1/School-project-opensource2021.git  ./scripts
docker-compose -f ./scripts/docker-compose.yml up
fi


