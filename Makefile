ROOT=$(CURDIR)

include DockerImages.mak

create:
	@mkdir $(project) \
		&& echo '0.0.1' > $(project)/TAG \
		&& echo joaodubas/$(project) > $(project)/REPOSITORY \
		&& touch $(project)/Dockerfile \
		&& cp LICENSE $(project)/LICENSE

install:
	@./bin/install_docker \
		-s \
		-p $(DOCKER_$(image)) \
		-r `cat $(DOCKER_$(image))/REPOSITORY` \
		-t `cat $(DOCKER_$(image))/TAG`

.PHONY:	install create
