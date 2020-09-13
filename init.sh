
docker stop code-server
docker rm code-server

docker create \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e PASSWORD=password `#optional` \
  -e SUDO_PASSWORD=password `#optional` \
  -p 8443:8443 \
  -v $HOME/vscode_data:/config \
  -v $HOME/main: /main \
  --restart unless-stopped \
  linuxserver/code-server

docker start code-server


#   -e PROXY_DOMAIN=code-server.my.domain `#optional` \