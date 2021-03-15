# ELK_CLUSTER


# Secure ELK cluster

1.Installed elk node in a private subnet then attched it with public subnet .
2.public subnet is associated with nat gateway /
3.Through nat gateway using route table it comm with private subnet .
4.Nat provide access to internet through internet gateway .
5.elastic ip assigned to nat gatway resource 

#RESORCES USED 
> ec2
> vpc
> Internet Gateway
> route table
> Nat Gatway
> elastic IP
> 

# RUN SETUP

terraform init
terraform validate 
terrfaform plan
terraform apply

#PREREQUISTE
TERRAFORM
AWS CLI // to connect to aws 
         aws configure :
         provide acess key and and secret access key devopsadmin
         
#INSTALL_SCRIPT

installs elastic search on master and node 

1. What did you choose to automate the provisioning and bootstrapping of the instance? Why?
>>choose terraform to automate the provisioning of elk cluster as code based approach helps to configure and deploy these infra quickly and consistently 
 
3. How did you choose to secure ElasticSearch? Why?
>> To secure elastic search i'v launched elk custer on ec2 instaces in private subnet which is connected to public subnet through nat gateway . So no one has direct       access to elk cluster.

5.  How would you monitor this instance? What metrics would you monitor?
>> curl localhost:9200/_cat/health
>> Use elb or ha proxy load balancer with ec2 instances to check http 200ok  response as metric 

7.  Could you extend your solution to launch a secure cluster of ElasticSearch nodes? What would need to change to support this use case?
>> Yes plz ref Q3

9.  Could you extend your solution to replace a running ElasticSearch instance with little or no downtime? How?
>> yes attaching the subnet with ec2 instaces to autoscaling group in aws which would healthcheck and replace the instance if found unhealthy.

11.  Was it a priority to make your code well structured, extensible, and reusable?
>> yes but to time couldnt do it well .

13. What sacrifices did you make due to time?
>> lack of documentation modularity in code.
