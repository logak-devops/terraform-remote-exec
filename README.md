# terraform-remote-exec

```
wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
unzip terraform_1.0.1_linux_amd64.zip
export PATH=$PATH:/opt/

```

Note : Either generate ssh-keygen or copy the .pem file into /opt location.


```
# To push image in aws ecs:

Create repo:

aws ecr create-repository --repository-name ecs-nodejs/home

 aws ecr get-login --no-include-email --region us-east-1

Then build the image and push into ecr with aws push commands
```
