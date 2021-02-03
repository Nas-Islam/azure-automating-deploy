#!/bin/bash

apt update && apt git curl -y
curl https://get.docker.com | sudo bash
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
newgrp docker

git clone https://github.com/qac-devops/chaperootodo_client.git
cd chaperootodo_client
export DB_PASSWORD=password
docker-compose pull && docker-compose up -d