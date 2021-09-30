!/bin/sh

echo "Ik heb hier geen zin meer in"

echo "Wilt u alvast docker installeren (ja/nee)"
read input
if [ "$input" == "nee" ];
then
echo "oke dan niet ";
fi;

if [ "$input" == "ja" ];
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
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
fi;

echo "Wil jij een firewall (ja/nee)"
read input
if [ "$input" == "nee" ];
then echo "Dan niet"
fi;

if [ "$input" == "ja" ];
then
echo "Firewall wordt ingesteld om alles te accepteren"
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
fi;

echo "Wil je nextcloud? (ja/nee)"
read input
if [ "$input" == "nee" ]
then
echo "Okey dan niet"
fi; 
if [ "$input" == "ja" ]
then
echo "Graag config aanpassen naar wensen hierna zal de installatie beginnen"
mkdir ./scripts
git clone https://github.com/jensdekker1/School-project-opensource2021.git  ./scripts
nano ./scripts/docker-compose.yml
docker-compose -f ./scripts/docker-compose.yml up -d
echo "veel plezier" 
fi;

