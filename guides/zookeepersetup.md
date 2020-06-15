# create user and add a home directory
sudo useradd zk -m

# set shell to bash
sudo usermod --shell /bin/bash zk

# set a password for this user
sudo passwd zk 

# add zk to sudo group

sudo usermod -aG sudo zk

# now for the security bit, disable ssh access to the zk user

Open your sshd_config file:

`sudo vim /etc/ssh/sshd_config`
Locate the `PermitRootLogin` line and set the value to `no` to disable SSH access for the root user:

```
FILE: /etc/ssh/sshd_config

PermitRootLogin no
DenyUsers zk
```

Under the PermitRootLogin value, add a DenyUsers line and set the value as any user who should have SSH access disabled:

Save and exit the file and then restart the SSH daemon to activate the changes.

`sudo systemctl restart sshd`


# Switch to the user
su -l zk

# Creating a Data Directory for ZooKeeper

`sudo mkdir -p /data/zookeeper`

own the directory as zk

`sudo chown zk:zk /data/zookeeper`

chown changes the ownership and group of the /data/zookeeper directory so that the user zk, who belongs to the group zk, owns the data directory.

You have successfully created and configured the data directory. When you move on to configure ZooKeeper, you will specify this path as the data directory that ZooKeeper will use to store its files.

# download zookeeper

Since you are downloading these files manually, start by changing to the /opt directory:

`cd /opt`

`sudo wget https://mirrors.estointernet.in/apache/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz`


untar the binary

`tar xvf apache-zookeeper-3.6.1-bin.tar.gz` (may need sudo)

own the directory

sudo chown zk:zk -R  apache-zookeeper-3.6.1-bin

## own the zookepeer soft link (for easier version management)
sudo ln -s apache-zookeeper-3.6.1-bin zookeeper
sudo chown -h zk:zk zookeeper


# configuring zookeeper

The configuration file will live in the `/opt/zookeeper/conf` directory. This directory contains a sample configuration file that comes with the ZooKeeper distribution. This sample file, named zoo_sample.cfg, contains the most common configuration parameter definitions and sample values for these parameters. Some of the common parameters are as follows:

tickTime: Sets the length of a tick in milliseconds. A tick is a time unit used by ZooKeeper to measure the length between heartbeats. Minimum session timeouts are twice the tickTime.
dataDir: Specifies the directory used to store snapshots of the in-memory database and the transaction log for updates. You could choose to specify a separate directory for transaction logs.
clientPort: The port used to listen for client connections.
maxClientCnxns: Limits the maximum number of client connections.

change the properties to
```
tickTime=2000
dataDir=/data/zookeeper
clientPort=2181
maxClientCnxns=60
```


# start zookeeper

> NOTE: install java first

```
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 

sudo add-apt-repository 'deb https://apt.corretto.aws stable main'

sudo apt-get update; sudo apt-get install -y java-11-amazon-corretto-jdk
```

`cd /opt/zookeeper`
`bin/zkServer.sh start`

connect to the local instance
`bin/zkCli.sh -server 127.0.0.1:2181`

> NOTE: You will get a prompt with the label `CONNECTED`. This confirms that you have a successful local, standalone ZooKeeper installation. 


# stop zookeeper

`bin/zkServer.sh stop`


# setup auto start via systemd

`sudo vim /etc/systemd/system/zk.service`

File contents

```
[Unit]
Description=Zookeeper Daemon
Documentation=http://zookeeper.apache.org
Requires=network.target
After=network.target

[Service]    
Type=forking
WorkingDirectory=/opt/zookeeper
User=zk
Group=zk
ExecStart=/opt/zookeeper/bin/zkServer.sh start /opt/zookeeper/conf/zoo.cfg
ExecStop=/opt/zookeeper/bin/zkServer.sh stop /opt/zookeeper/conf/zoo.cfg
ExecReload=/opt/zookeeper/bin/zkServer.sh restart /opt/zookeeper/conf/zoo.cfg
TimeoutSec=30
Restart=on-failure

[Install]
WantedBy=default.target
```

Now that your systemd configuration is in place, you can start the service:

`sudo systemctl start zk`

Once you’ve confirmed that your systemd file can successfully start the service, you will enable the service to start on boot.
`sudo systemctl enable zk`

The output confirms the creation of the symbolic link:

## Check the status of the ZooKeeper service using
`sudo systemctl status zk`

## stop the service 
`sudo systemctl stop zk`


## restart the service 
`sudo systemctl restart zk`



# MuliNode Setup

Now spawn N VMs with this disk 

for each one, create the `/data/zookeeper directory` and `chown` it. 
then restart the zookeeper service to check if it all works...



goto each node and do:

`sudo vim /data/zookeeper/myid`


for each node write an integer that corresponds to that node, so for 3 nodes 

node1 -> 1
node2 -> 2
node3 -> 3


now change the `zoo.conf` file to include:
```
tickTime=2000
dataDir=/data/zookeeper
clientPort=2181
maxClientCnxns=60
initLimit=10
syncLimit=5
server.1=your_zookeeper_node_1:2888:3888
server.2=your_zookeeper_node_2:2888:3888
server.3=your_zookeeper_node_3:2888:3888

```
NOTE: most of these will be setup from the earlier step, just add the missing ones



java -cp zookeeper-3.6.1.jar:lib/log4j-1.2.17.jar:lib/slf4j-log4j12-1.7.25.jar:lib/slf4j-api-1.7.25.jar:conf org.apache.zookeeper.server.quorum.QuorumPeerMain conf/zoo.cfg

