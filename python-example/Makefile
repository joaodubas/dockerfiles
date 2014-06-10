ROOT=$(CURDIR)

FOLDER_APP=-v $(ROOT)/app:/opt/app

PORT_SSH=-p 4022:22
PORT_SUPERVISOR=-p 9001:9001
PORT_APP=-p 10080:8080
PORTS=$(PORT_SSH) $(PORT_SUPERVISOR) $(PORT_APP)

DOCKER_OPTIONS=--name python-example $(FOLDER_APP) $(PORTS)
DOCKER_IMAGE=joaodubas/python-example:0.0.2

start:
	@docker run -d $(DOCKER_OPTIONS) $(DOCKER_IMAGE)

run:
	@docker run -i -t --rm $(DOCKER_OPTIONS) --entrypoint /opt/.venv/app/bin/python $(DOCKER_IMAGE) /opt/app/main.py

ipython:
	@docker run -i -t --rm $(DOCKER_OPTIONS) --entrypoint /opt/.venv/app/bin/ipython $(DOCKER_IMAGE) ""


.PHONY=start run ipython
