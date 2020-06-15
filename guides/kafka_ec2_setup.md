# Download Kafka

`wget https://mirrors.estointernet.in/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz`

untar the file
`sudo tar xvf kafka_2.12-2.5.0.tgz`

cd to configruation directory
`cd kafka_2.12-2.5.0/config`


edit `server.properties` with

```
# The id of the broker. This must be set to a unique integer for each broker.
broker.id=30
 
# A comma seperated list of directories under which to store log files
log.dirs=/tmp/kafka-logs
advertised.host.name=<ip address of host>
# add all 3 zookeeper instances ip here
zookeeper.connect=<i>:2181,<ip>:2181,<ip>:2181
zookeeper.connection.timeout.ms=6000
```

from the kafka root directory do

`bin/kafka-server-start.sh config/server.properties`



