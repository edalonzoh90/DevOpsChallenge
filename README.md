# Acklen Avenue - DevOpsChallenge  
#### Challenge Instructions - Devops-Challenge.pdf  
#### Prerequisites  
* Terraform installed
* Ansible installed
* AWS Console account  
* IAM Admin User  
* SSH Key

#### To run  
1. Edit /1 Terraform/vars.tf file adding the values for 
  - AWS_ACCESS_KEY
  - AWS_SECRET_KEY
  - PATH_TO_PRIVATE_KEY
  - PATH_TO_PUBLIC_KEY
2. Using a termina
3. Located into /1 Terraform/ folder, run:  
`terraform init`  
`terraform apply`
4. Get the Ips of the EC2 instance
3. Setup the inventory.txt file with the Ips
4. Located into /2 Ansible folder, run:  
`ansible-playbook playbook.yml -i inventory.txt`  
5. Ready, copy and open in a a browser the Load balancer URL :) 
