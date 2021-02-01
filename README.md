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
![alt text](https://raw.githubusercontent.com/edalonzoh90/DevOpsChallenge/master/Media/img01.png)

## Test the Deploying Script
_Require Ansible installed in the host_

Once the infrastructure is created, the script for the deployment is in 'Ansible/app.yml'
Into 'Ansible' folder, run:
```
ansible-playbook app.yml
```
The result of this, is the application deployed in the local computer.
You will see that the source code is downloaded in your home

![alt text](https://raw.githubusercontent.com/edalonzoh90/DevOpsChallenge/master/Media/img04.png)

And the app is running on http://localhost:5000 

![alt text](https://raw.githubusercontent.com/edalonzoh90/DevOpsChallenge/master/Media/img03.png)

## Deploying to Azure VM's

To deploy the VMs it is necessary to obtain the IP address of each of VM's of the load balancer, the instructions to achieve this are found in the file 'Ansible/get-hosts-tasks.yml'

Unfortunately I had some compatibility problems with some Python packages that Ansible required, so I could not do the test, and therefore conclude with the challenge...
