# Installation

https://github.com/pi-hole/docker-pi-hole


run docker compose script 

to use my setup please use this is repo

https://gitlab.com/codexetreme/pihole_server

# installation hiccups

On ubuntu the pesky systemd will cause issues, so from the docs of pihole

```
sudo systemctl disable systemd-resolved.service

sudo systemctl stop systemd-resolved.service

sudo nano /etc/NetworkManager/NetworkManager.conf

```

Add `dns=default` under [main] so that the file contents look like what is shown below:

```
[main]
plugins=ifupdown,keyfile
dns=default
```

# Visit the web gui

goto `0.0.0.0/admin`

# password

set the config var `WEBPASSWORD` and use thet

# status monitor the status with 

`watch docker ps | grep pihole` the status should change from `statring` to `healthy`