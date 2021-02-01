# DevOps Challenge
Infrastructure automation and deployment of a Node base application on Azure Cloud VM, using Terraform and Ansible

## Challenge
**For infraestructure use Terraform, for app deploy use Ansible**
- Create 2  azure cloud VM's into a VPC.
- Use a load balancer to dristribute the traffic
- Deploy a node.js base app into this 2 VM's 

## Creating Infrastructure
'Terraform/Main.tf' contains all the necessary instructions for the creation of the infrastructure via Terraform.
_It required to get the parameters from the cloud provider. For this, it is necessary to create a "Service Principal" that helps us to authenticate the Terraform application._

Into 'Terraform' folder, run:

```
Terraform init
Terraform plan
Terraform apply
```

The result of this is the creation of the infrastructure defined at the beginning.
![alt text](/media/img01.png)


