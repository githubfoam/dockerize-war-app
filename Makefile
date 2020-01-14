build_base:
	@docker build . --target build_base -t centos7/tomcat:build_base --file dockerfiles/Dockerfile.tomcat.multi

build_env:
	@docker build . --target build_env -t centos7/tomcat:build_env --file dockerfiles/Dockerfile.tomcat.multi

build_openjdk11:
	@docker build . --target build_openjdk11 -t centos7/tomcat:build_openjdk11 --file dockerfiles/Dockerfile.tomcat.multi

build_tomcat9030:
	@docker build . --target build_tomcat9030_openjdk11 -t centos7/tomcat:build_tomcat9030_openjdk11 --file dockerfiles/Dockerfile.tomcat.multi

config_admin:
	@docker build . --target config_admin -t centos7/tomcat:config_admin --file dockerfiles/Dockerfile.tomcat.multi

deploy_sampleapp:
	@docker build . --target deploy_sampleapp -t centos7/tomcat:deploy_sampleapp --file dockerfiles/Dockerfile.tomcat.multi

build_finalize:
	@docker build . --target build_finalize -t centos7/tomcat:build_finalize --file dockerfiles/Dockerfile.tomcat.multi

clean:
	@docker rmi $(docker images -q -f dangling=true)

build_all:
	@docker build . --target build_base -t centos7/tomcat:build_base --file dockerfiles/Dockerfile.tomcat.multi
	@docker build . --target build_env -t centos7/tomcat:build_env --file dockerfiles/Dockerfile.tomcat.multi
	@docker build . --target build_openjdk11 -t centos7/tomcat:build_openjdk11 --file dockerfiles/Dockerfile.tomcat.multi
	@docker build . --target build_tomcat9030 -t centos7/tomcat:build_tomcat9030 --file dockerfiles/Dockerfile.tomcat.multi
	@docker build . --target config_admin -t centos7/tomcat:config_admin --file dockerfiles/Dockerfile.tomcat.multi
	@docker build . --target deploy_sampleapp -t centos7/tomcat:deploy_sampleapp --file dockerfiles/Dockerfile.tomcat.multi
	@docker build . --target build_finalize -t centos7/tomcat:build_finalize --file dockerfiles/Dockerfile.tomcat.multi
