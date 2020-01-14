# dockerize-war-app

Travis (.com) dev branch:
[![Build Status](https://travis-ci.com/githubfoam/dockerize-war-app.svg?branch=master)](https://travis-ci.com/githubfoam/dockerize-war-app)  

building tomcat-9.0.30 image with OpenJDK 11 JDK

~~~~

"sudo docker build --target build_base -t centos7/tomcat:build_base --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target build_env -t centos7/tomcat:build_env --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target build_openjdk11 -t centos7/tomcat:build_openjdk11 --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target build_tomcat9030 -t centos7/tomcat:build_tomcat9030 --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target config_admin -t centos7/tomcat:config_admin --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target deploy_sampleapp -t centos7/tomcat:deploy_sampleapp --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target build_finalize -t centos7/tomcat:tomcat9030-openjdk11 --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."


$ sudo docker image ls
REPOSITORY          TAG                    IMAGE ID            CREATED              SIZE
centos7/tomcat      tomcat9030-openjdk11   3f784ae7d362        5 seconds ago        690MB
centos7/tomcat      deploy_sampleapp       e95ba8624bb9        About a minute ago   690MB
centos7/tomcat      config_admin           b0e94edbdb14        About a minute ago   690MB
centos7/tomcat      build_tomcat9030       c710573883e2        About a minute ago   690MB
centos7/tomcat      build_openjdk11        916f4bc40248        10 minutes ago       674MB
centos7/tomcat      build_env              75786cc3cd51        14 minutes ago       366MB
centos7/tomcat      build_base             7ff20890a7e6        4 hours ago          366MB

"$ sudo docker container run -it -d --name tomcat9030-openjdk11 -p 8080:8080 -p 8009:8009 centos7/tomcat:tomcat9030-openjdk11
cf6d9af51869ec0360efd06100f78b9da091bda6da087f007a76f5103fc665a8"

$ sudo docker container logs tomcat9030-openjdk11

curl http://localhost:8080
curl http://localhost:8080/SampleWebapp

$ netstat -ltun | grep 80
tcp6       0      0 :::8009                 :::*                    LISTEN
tcp6       0      0 :::8080                 :::*                    LISTEN

browse
http://172.28.128.12:8080/
http://172.28.128.12:8080/examples/
http://172.28.128.12:8080/SampleWebApp/
~~~~

building tomcat-9.0.30 image with OpenJDK 7 JRE
~~~~

"sudo docker build --target build_openjre7 -t centos7/tomcat:build_openjre7 --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target build_tomcat9030-openjre7 -t centos7/tomcat:build_tomcat9030-openjre7 --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target config_admin -t centos7/tomcat:config_admin --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target deploy_sampleapp -t centos7/tomcat:deploy_sampleapp --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."
"sudo docker build --target build_finalize -t centos7/tomcat:tomcat9030-openjdk11 --file /vagrant/dockerfiles/2/Dockerfile.tomcat.multi ."

~~~~
troubleshooting
~~~~
$ sudo docker run -it centos7/tomcat:build_base
[root@0fc4b0bfdfe6 /]#
[root@66f5829da2e4 /]# ls -l /usr/lib/jvm
total 0
drwxr-xr-x. 6 root root 68 Jan 10 17:54 java-11-openjdk-11.0.5.10-0.el7_7.x86_64
~~~~
