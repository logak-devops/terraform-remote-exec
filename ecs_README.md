```

Link: https://medium.com/@bradford_hamilton/deploying-containers-on-amazons-ecs-using-fargate-and-terraform-part-2-2e6f6a3a957f
provider "aws" {
   region = "us-east-1"
   shared_credentials_file = "/root/.aws/credential"
}

resource "aws_ecr_repository" "demo-repository" {
  name                 = "demo-repo"
  image_tag_mutability = "IMMUTABLE"
}

output "demo-repo-url" {
  value = aws_ecr_repository.demo-repository.repository_url
}

```

```
   docker images
   docker tag ${image_id} ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${repository-name}:${image_tag}
   docker push ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${repository-name}
```

Amazon's Elastic Container Service, just like kubernetes, helps to manage containers. With ECS, you only have define a few resources and ECS takes care of the rest, in terms of auto-scaling, using the load-balancer, and also deciding when to spin up new tasks depending on the traffic on one or any of the existing containers.


An internet gateway is a service that allows for internet traffic to actually enter into a VPC. Otherwise, a VPC is completely segmented off and then the only way to get to it is potentially through a VPN connection rather than through an internet connection.

An Internet Gateway is a logical connection between an AWS VPC and the Internet. It is not a physical device. Each VPC has only one Internet Gateway. If a VPC doesn’t have an Internet Gateway, then the resources cannot be accessed from the Internet. Conversely, resources within your VPC need an Internet Gateway to access the Internet.

Below are the resources that ECS needs to be defined:
====================================================

      >> Cluster
      >> Service
      >> Task Definition

# Task Definition :
=================
The ecs_task_definition is the most important unit the ECS ecosystem. It contains memory and cpu allocations, the container definitions etc. The container definition has port mappings for the container and host, and most importantly the image from ECR.

# Service :
===========

This defines the how many instances of the task_definition we want to run, we provide this with the desired_count attribute. Each instance of a task_definition is called a Task. The service also requires network configuration for subnet(s). The launch_type attribute for the service is very crucial. Only two types exist ie FARGATE or EC2. Using FARGATE means you dont have to worry about managing a cluster and/or its services, FARGATE does that for you. With EC2 launch type, you would have to be responsible for managing the cluster with its EC2 instances. This is why we have a launch_type of FARGATE for the aws_ecs_service resource.

# Cluster :
===========

This is ultimate component for ECS. A cluster can contain multiple ecs_services, with each service running multiple instances of the task_definition. Having a service of launch_type FARGATE means ECS gets to manage for you cluster and service optmization and resource utilization. In case one of the tasks fails within a cluster, ECS will automatically spin up a new task with same cpu and memory allocation defined in the task_definition




