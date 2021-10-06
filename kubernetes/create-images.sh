#!/bin/bash

# create secrets
# kp secret create harbor-secret --registry harbor.tanzu.be --registry-user bmullan
# create ssh key using ssh-keygen
# register with github. 
# to check the value of secret
# k get secret/github-secret -o jsonpath="{.data.ssh-privatekey}"  | base64 -d
# kp secret create github-secret --git-url git@github.com --git-ssh-key ~/.ssh/iso_rsa

# git@github.com:bmullan-pivotal/sample-spring-microservices-new.git


# curl -s http://employee:8080/ -H "Content-Type: application/json" --data-binary '{"name":"Barney","age":30,"position":"FS","departmentId":"1","organizationId":3200}' -X POST {"id":"614a2dd8ae7ef10e0e5c6141","organizationId":3200,"departmentId":1,"name":"Barney","age":30,"position":"FS","location":"N3"}
kp image create iso-deparment-service 
 --tag harbor.tanzu.be/library/iso-department-service  
 --git git@github.com:bmullan-pivotal/sample-spring-microservices-new.git 
 --git-revision kubernetes
 --sub-path department-service

kp image create iso-employee-service 
 --tag harbor.tanzu.be/library/iso-employee-service 
 --git git@github.com:bmullan-pivotal/sample-spring-microservices-new.git 
 --git-revision kubernetes 
 --sub-path employee-service

kp image create iso-employee-service  --tag harbor.tanzu.be/library/iso-employee-service --git git@github.com:bmullan-pivotal/sample-spring-microservices-new.git  --git-revision kubernetes --sub-path employee-service


kp image create iso-gateway-service 
 --tag harbor.tanzu.be/library/iso-gateway-service 
 --git git@github.com:bmullan-pivotal/sample-spring-microservices-new.git 
 --git-revision kubernetes 
 --sub-path gateway-service

kp image create iso-organization-service 
 --tag harbor.tanzu.be/library/iso-organization-service 
 --git git@github.com:bmullan-pivotal/sample-spring-microservices-new.git 
 --git-revision kubernetes 
 --sub-path organization-service


# launch pod with network utils.
kubectl run --rm utils -it --restart=Never --image arunvelsriram/utils bash


