# phlax/docker-triggers
#
# VERSION       0.0.1

# requires deb to be in dist folder
# run `make deb` in parent folder to create

ARG BUILD_FROM=phlax/systemd
ARG MAINTAINER="Ryan Northey <ryan@synca.io>"

# Root stage
FROM $BUILD_FROM as root
MAINTAINER $MAINTAINER

COPY dist /tmp/dist

RUN mkdir -p /usr/share/docker-triggers \
	&& cp -a /tmp/dist/* /usr/share/docker-triggers/ \
	&& apt update \
	&& apt install -y -qq \
	     --no-install-recommends \
	     --no-install-suggests \
	        gnupg2 \
	        software-properties-common \
	        wget \
	&& wget -qq -O - https://download.docker.com/linux/debian/gpg | apt-key add - \
	&& apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" \
	&& apt update \
	&& apt install -y -qq /usr/share/docker-triggers/docker-triggers_*deb
