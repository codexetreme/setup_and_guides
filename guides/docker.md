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



# Raspberry Pi Install


## Docker

`sudo apt install docker.io` 
not the most updated, but pretty updated, since for a PI, its arm and currently its a bit flimsy in support, so use the ubuntu repos first

## Docker compose 

```
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser

sudo pip3 install docker-compose
```

this is taken from here https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl


we have to do it this way, cause the official docs only list a download from the ubuntu repos via automated plugging of arch and os names via command like uname -s and uname -m, which on a PI give a combination that does not exist for docker-compose, so we need to go old school to install it.

# installing docker on AWS

to install on linux AMI 2 instances please do this
https://stackoverflow.com/questions/60690568/unable-to-install-docker-on-aws-linux-ami
if already accidentally installed docker from the instructions on the docker site

this is the correct way to do it  
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

## installing docker compose on AWS

same as that of normal install process
