# install docker

## Run these commands

- `sudo apt-get update`
- ```
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    ```
- `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

- ```
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   ```

---
> Some times the above command gives an error: `malformed input`,
>  in that case, please do

- Add the line 
  - `deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable` to `/etc/apt/sources.list.d/addtional-repositories.list`
  - (create the file if it does not exist)

> Rest of the steps are the same

---

- `sudo apt-get update`
- `sudo apt-get install docker-ce docker-ce-cli containerd.io`

Add yourself to the docker group

- `sudo groupadd docker`
- `sudo usermod -aG docker $USER`

Post this you should logout and login again, but if you can't use this command instead

- `newgrp docker`

# Docker Compose Install

Run
- `sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose` 

> To install a different version of Compose, substitute `1.24.1` with the version of Compose you want to use.

- `sudo chmod +x /usr/local/bin/docker-compose`