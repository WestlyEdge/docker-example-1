# docker-example
This project contains...
- a Web Application
- a Docker Image
- a Container Application Hosting Platform 
- a CICD Deploy Pipeline Configuration

### Web Application

- the web app is a single html page located @ */build-context/html/index.html*

### Docker Image

- this project contains a DockerFile that is used to build a container image that hosts the web application mentioned above

- our container is running apache web server (httpd), we accomplished this by basing our container from [the latest apache linux (alpine) image in docker hub](https://hub.docker.com/_/httpd). (see the FROM directive in the DockerFile)

- the web application exists within the *"/build-context"* directory, 
this allows us to easily install our web application into the container by simply copying it to the apache web servers' default web app directory 
 within the container (see the COPY directive in the DockerFile)
 
- this project contains shell scripts that may be used while developing the container image on your local workstation 
 
    - `/scripts/docker-build.sh` (builds the docker image on your local workstation)
    - `/scripts/docker-run.sh` (runs the docker container on your local workstation)
    - `/scripts/docker-hub-push.sh` (pushes your local container image to docker hub)
    - `/scripts/docker-hub-pull.sh` (pulls your latest container image from docker hub)
    - `/scripts/docker-clear.sh` (helpful script deletes all docker images and running containers on your local workstation)
 
### Container Application Hosting Platform

- this project contains a CloudFormation template file @ *"/iac/template.yaml"*. This file is used to create virtual infrastructure
 in AWS cloud services

    - the template.yaml file contains the resource configuration to build our container application hosting platform (based on ECS)  
    
    - the template.yaml file also contains the resource configuration to run our new container image as an ECS service on the new ECS cluster
    
- this project contains shell scripts that may be used while developing the CloudFormation template on your local workstation 
 
    - `/iac/scripts/validate-stack.sh` (validates your CloudFormation template file for errors)
    - `/iac/scripts/create-stack.sh` (create the infrastructure stack in your AWS account)
    - `/iac/scripts/update-stack.sh` (update the existing infrastructure stack in your AWS account)
    - `/iac/scripts/delete-stack.sh` (delete the existing infrastructure stack in your AWS account)
    - `/iac/scripts/ssh-to-ec2.sh` (modify and use this helpful script if you want to ssh into an aws ec2 instance)
    
### CICD Deploy Pipeline Configuration

- this project contains a CloudFormation input param configuration file @ *"/iac/cicd-config/prod.json"*

    - an AWS CodePipeline job named *"TODO"* has been manually created in the AWS account (not using CloudFormation)
     
    - The CodePipeline job will clone the project repo and apply the CloudFormation template when 
    changes occur on the master branch of this github project repo

### Known Problems

- while deleting the CloudFormation stack, sometimes the command will fail because of a race condition where the ECS cluster is
not able to be deleted because some of it's child resources are still existing. When this happens, you can simply delete 
the stack a second time to remedy the problem. A proper fix would be nice though. 
    
 