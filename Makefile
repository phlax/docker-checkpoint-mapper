#!/usr/bin/make -f

SHELL := /bin/bash


deb:
	docker run --rm -ti \
		-e RUN_UID=`id -u` \
		-v `pwd`:/home/bob/build phlax/debian-build \
		bash -c "\
		  cd /home/bob/build \
		  && dpkg-buildpackage -us -uc -b \
		  && mkdir context/dist -p \
		  && cp -a ../docker-triggers* context/dist"

image: deb
	docker build -t phlax/docker-triggers context

hub-image:
	docker push phlax/docker-triggers
