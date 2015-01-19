.SILENT :
.PHONY : help volume dev build clean cleanup run shell

USERNAME:=ncarlier
APPNAME:=shelltoolbox
IMAGE:=$(USERNAME)/$(APPNAME)

define docker_run_flags
--rm \
-e DOMAIN_NAME=ncarlier.github.io \
-P \
-i -t
endef

all: build cleanup

## This help screen
help:
	printf "Available targets:\n\n"
	awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "%-15s %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Make the volume image
volume:
	echo "Building $(APPNAME) volumes..."
	sudo docker run -v $(PWD):/opt/$(APPNAME) --name $(APPNAME)_volumes busybox true

## Enable DEVMODE (mount volumes)
dev:
	$(eval docker_run_flags += --volumes-from $(APPNAME)_volumes)
	echo "DEVMODE: Using volumes from $(APPNAME)_volumes"

## Build the image
build:
	echo "Building $(IMAGE) docker image..."
	sudo docker build --rm -t $(IMAGE) .

## Remove the image
clean:
	echo "Removing $(IMAGE) docker image..."
	-sudo docker rmi $(IMAGE)

## Remove dangling images
cleanup:
	echo "Removing dangling docker images..."
	-sudo docker images -q --filter 'dangling=true' | xargs sudo docker rmi

## Run the container
run:
	echo "Running $(IMAGE) docker image..."
	sudo docker run $(docker_run_flags) --name $(APPNAME) $(IMAGE)

## Run the container with shell access
shell:
	echo "Running $(IMAGE) docker image with shell access..."
	sudo docker run $(docker_run_flags) --entrypoint="/bin/bash" $(IMAGE) -c /bin/bash

