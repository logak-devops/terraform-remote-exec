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

# ECS --> EC2 Container Service will manage your docker containers
  For that we just need to start an autoscaling group with custom AMI
  
   This customer AMI contains the ECS Agent
   
  Once the ECS cluster is online, task and services can be started on cluster
  
  Cluster is group of EC2 instance. and ECS Service will manage this server
  
  
  Step1 => ECS cluster needs to be defined
   
   resource "aws_ecs_cluster" "test-cluster" {
       name = "test-cluster"
   }
   
   
  Step 2 ==> Autoscaling group launches EC2 instances that will join in cluster
  
  Step3 ==> Before the docker app can be launched , a task definition needs to be provided
  The task defnition describes what docker container to be run on the cluster
   
      >> Specify the docker image or ECR docker image
      >>  Max CPU usage and memory
      >> in case of db app, the container should be linked, need to specify those details
      >> Credenntails details environment variable
      >> And any other container specific definition
      
      
 Step 4  ==> Service definition  is going to run a specific amount of containers based on task definition
      The status of service is always in running if the container stops ,it will be restarted
      A service can be scaled ,you can run 1 instance of a container or multiple
      Also we can put elb in front of service
      
      Running multiple instance with ELB allows you to have High availabilty
      
 ```
