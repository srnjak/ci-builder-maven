# Use the specified Maven version as a build argument
ARG MAVEN_VERSION=3.9.6

FROM maven:${MAVEN_VERSION}

RUN apt-get update && apt-get install -y \
    ssh
