#ECS:
 ===
 
 ```
 >> Task Definition:
 
      >> Ports number                 : 80/8080 Depends on images
      >> Container Image              : ecr image  
      >> Launch Type 
      (Computer Mode - CPU & Memory)  : Fargate EC2
      >> Network                      : Bridge or AWSVPC(We can run our container inside VPC particularly in private Network) 
      
      
      How Frontend is communicating with backend?
      
       Frontend ------------> LoadBalancer
       
       The request which we generate from the fronend , first receive from the loadbalancer and the oadbalncer will have set of rules called(rule 1 and rule2). 
       Theses rules inspect the traffic that we received to loadbalance from frontent and then inspect the port number, host and path pattern.
       
       For network and application loadbalncer we can configure the logical group  called target group. the loadbalncer can redirect the traffic 
       if the rules defined in TG matches.These Target could be EC2 instance or IP address.
       
       AWS Fargate to manage the compute for cluster and using AWSVPC as Network, each of these ontainers receives private Network
       
       If Load balancer rules matches with TG1 and the target run in service.
       For example in google.com/ and if path is account and it matches with tg1 then it directs to registered service. Thereby the task 
       will receive from the loadbalncer.
       
       Now , the target group is connected with service which maintain  a single container or a task where our application is running. At any point of time, 
       we can increase the count by two three four. When the load is increasing when there is a lot of request from frontend our load balancer delivers
       the traffic to running container eqaully.
```
