# DevOps Challenge
Infrastructure automation and deployment of a Node base application on Azure Cloud VM, using Terraform and Ansible

## Challenge
**For infraestructure use Terraform, for app deploy use Ansible**
- Create 2  azure cloud VM's into a VPC.
- Use a load balancer to dristribute the traffic
- Deploy a node.js base app into this 2 VM's 

## Creating Infrastructure
'Terraform/Main.tf' contains all the necessary instructions for the creation of the infrastructure via Terraform.
It required to get the parameters from the cloud provider. For this, it is necessary to create a "main service" that helps us to authenticate the Terraform application.
