
## Infraestructure diagram
![Alt text](Infraestructure.png?raw=true "Infraestructure diagram")

## Notes
__Create a ssh key__  
`ssh-keygen -f mykey`  

__Connect to ec2 via ssh__  
`ssh 3.84.92.132 -l ubuntu -i ~/Documents/ssh/mykey`

__Install httpd-apache2__  
`sudo apt-get update  
sudo apt install apache2 -y`  

__Install node__  
`npm install`  

__Run node app__  
`node app.js`  

__Ports in use__  
`netstat -tnlp`  

## References
https://www.ahead.com/resources/how-to-create-custom-ec2-vpcs-in-aws-using-terraform/
https://hceris.com/provisioning-a-network-load-balancer-with-terraform/
https://www.youtube.com/watch?v=g2JOHLHh4rI
https://bobbyhadz.com/blog/aws-cli-get-default-profile
https://cloud-images.ubuntu.com/locator/ec2/
https://cloudkatha.com/how-to-install-apache-2-on-aws-ec2-instance-ubuntu-20-04/
https://www.linkedin.com/pulse/deploying-nodejs-app-using-ansible-antoine-choula-/
https://linuxhandbook.com/clone-git-ansible/
https://blog.logrocket.com/configuring-apache-for-node-js/
https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
https://medium.com/nonstopio/deploying-a-node-js-app-using-ansible-cfe7dfeddcac
https://www.scaleway.com/en/docs/tutorials/install-apache-ansible/
