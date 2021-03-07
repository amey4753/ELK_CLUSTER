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
         
         

