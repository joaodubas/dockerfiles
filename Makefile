CMD_BASE=docker
ROOT=$(CURDIR)

include DockerImages.mak

install:
	@./bin/install_docker \
		-s \
		-p $(DOCKER_$(image)) \
		-r `cat $(DOCKER_$(image))/REPOSITORY` \
		-t `cat $(DOCKER_$(image))/TAG`

local_run:
	@./bin/run_docker \
		-t $(IMAGE_DJANGO_LOCAL) \
		-v $(VERSION_DJANGO_LOCAL) \
		-m $(ROOT)/../:/opt/app \
		-p 40022:22 \
		-p 8061:8061\
		-p 9002:9001

local_test:
	@./bin/run_docker \
		-t $(IMAGE_DJANGO_TEST) \
		-v $(VERSION_DJANGO_TEST) \
		-m $(ROOT)/../:/opt/app \
		-p 40023:22 \
		-p 8062:8061\
		-p 9003:9001

.PHONY:	install
