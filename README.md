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
2. Create terraform code 
3. azure tag Policy 

### :pushpin: Create packer image

1) Create resource group to store Packer Image:

az group create -l eastus -n rg-packer-img

deploy your packer image in  rg-packer-img  ,before deploying you packer image you  have to register  packer application  

#### :diamond: register  packer application and get client_id ,client_secret, subscription_id
       1)regitration can be done via azure portal ---> Azure Active Directory ---> App registrations  and you can you client ID and client_secret from here
       2) -->Subscriptions -->Access control (IAM) -->Add role assignment --> assign role to your application 
       3)  use az account show to grab your subscription id , you need 'iD'.
