docker start \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e PASSWORD=password `#optional` \
  -e SUDO_PASSWORD=password `#optional` \
  -e PROXY_DOMAIN=code-server.my.domain `#optional` \
  -p 8443:8443 \
  -v $HOME/vscode_data:/config \
  --restart unless-stopped \
  linuxserver/code-server