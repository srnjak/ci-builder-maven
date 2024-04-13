# Use the specified Maven version as a build argument
ARG MAVEN_VERSION=3.9.6

FROM maven:${MAVEN_VERSION}

# Update package lists and install SSH and GnuPG
RUN apt-get update && apt-get install -y \
    ssh \
    gnupg2
