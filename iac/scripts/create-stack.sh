#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
REGION=us-east-2

aws --region $REGION cloudformation create-stack \
--stack-name "kelly-ecs-stack" \
--template-body "file://$SCRIPT_DIR/../template.yaml" \
--capabilities "CAPABILITY_NAMED_IAM" \
--parameters \
ParameterKey=ClusterName,ParameterValue="kelly-ecs-cluster" \
ParameterKey=EC2ImageId,ParameterValue="ami-0102692edc680b5b0" \
ParameterKey=EC2InstanceType,ParameterValue="t2.medium" \
ParameterKey=ServiceName,ParameterValue="kelly-ecs-service" \
ParameterKey=RoleName,ParameterValue="kelly-ecs-role" \
ParameterKey=KeyPairName,ParameterValue="wes-keypair" \
ParameterKey=ContainerImage,ParameterValue="kellyedge/web-app:latest" \
ParameterKey=LaunchConfigurationName,ParameterValue="kelly-launch-config1" \
ParameterKey=SubnetIds,ParameterValue="subnet-032939daa62aaf947\, subnet-05b2f8ab1751349da\, subnet-0e873b1762c601a23" \
ParameterKey=AutoScalingGroupMinSize,ParameterValue="2" \
ParameterKey=AutoScalingGroupMaxSize,ParameterValue="2" \
ParameterKey=VpcId,ParameterValue="vpc-04684fa84fec7b6c8" \
ParameterKey=ContainerServiceDesiredCount,ParameterValue="2" \
ParameterKey=ALBListenerPort,ParameterValue="80" \
ParameterKey=ALBListenerProtocol,ParameterValue="HTTP" \
ParameterKey=ECSHostPort,ParameterValue="80" \
ParameterKey=ECSContainerPort,ParameterValue="80" \
ParameterKey=ECSTaskMemory,ParameterValue="512"
