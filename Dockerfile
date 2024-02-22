FROM maven:3.9.6

RUN apt-get update && apt-get install -y \
    ssh
