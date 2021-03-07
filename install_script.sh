#!/bin/bash

# Script used to set up a new node inside an Elasticsearch cluster in AWS

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

sudo curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt install elasticsearch
echo ES_JAVA_OPTS="\"-Xms1g -Xmx1g\"" >> /etc/elasticsearch/elasticsearch.yml
echo MAX_LOCKED_MEMORY=unlimited >> /etc/elasticsearch/elasticsearch.yml

echo -e "yes\n" | /usr/share/elasticsearch/bin/elasticsearch-plugin install discovery-ec2

echo "discovery.zen.hosts_provider: master" >> /etc/elasticsearch/elasticsearch.yml
echo "cloud.aws.region: ap-south-1" >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: _master_" >> /etc/elasticsearch/elasticsearch.yml
sudo chkconfig --add elasticsearch

sudo update-rc.d elasticsearch defaults 95 10

sudo /etc/init.d/elasticsearch start
sudo service elasticsearch start

echo "Node setup finished!"
#service is running 
curl http://localhost:9200 
