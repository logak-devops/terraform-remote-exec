Scan Private Image
==================

```
docker run -d --name db arminc/clair-db:latest
docker run -d --link db:postgres --name clair arminc/clair-local-scan:v2.0.6
docker run --rm  -v /var/run/docker.sock:/var/run/docker.sock --network=container:clair ovotech/clair-scanner clair-scanner 932709730335.dkr.ecr.us-east-1.amazonaws.com/ecs-nodejs/home:latest

```

![image](https://user-images.githubusercontent.com/84037413/125349849-f1008300-e355-11eb-9e71-678e5acc6555.png)
