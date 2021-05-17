#Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure with LB 

This file contains code for creating Loadbalancer , virtual machine , NSG, Resource group , Virtual network and subnet using terraform .

## Getting Started

*Create your infrastructure as code
*Create your tagging-policy in Azure
*Create your resource group in Azure

## Dependencies

1.Create an Azure Account
2.Install the Azure command line interface
3.Install Packer
4.Install Terraform!

## Instructions

1. Create packer image 
2. run terraform code and create infra
3. azure tag Policy 

### :collision: Create packer image

1) Create resource group to store Packer Image:

az group create -l eastus -n NetworkWatcherRG

deploy your packer image in  NetworkWatcherRG  ,before deploying you packer image you  have to register  packer application  

#### :collision: register  packer application and get client_id ,client_secret, subscription_id and deploy
       1)regitration can be done via azure portal ---> Azure Active Directory ---> App registrations  and you can you client ID and client_secret from here
       2) -->Subscriptions -->Access control (IAM) -->Add role assignment --> assign role to your application 
       3)  use az account show to grab your subscription id , you need 'iD'.
       4)  Deploy image using packer build projserver.js

       
2. run terraform code and create infra

there are three files which i have created 1) main.tf 2)securitygroup.tf 3) VM.tf  just for easy understanding and breaking down complex code .
     
#### :collision: do following steps 
     1)go to directory where you have saved project and run 
     2) az login 
     3) terraform plan
     4) terraform apply


The following resources are created with the Terraform template:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Security group rules
- Public IP
- Load Balancer
- Backend Address pools
- Availability Set
- Network Interface Card(s)
- Virtual Machine(s)

3)  azure tag Policy  

This step need to completed before step 2 to see policy in action , this policy will check if indexed resource created have tags or not 

you can deploy policy via AZURE CLI or portal 
       
 ## Instructions for variable.tf

 This file contain user defined variable where you can give :
:cow2: prefix for various elements 
:cow2: you can provide number vm you want to create  
:cow2: user name and password for VM and image 
:cow2: under image   variable you need repalce it with your custome image id   , which you can get by running az vm list once packer image has been deployed     
    



