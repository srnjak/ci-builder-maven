FROM srnjak/ci-builder:3

# Set environment variables for OpenJDK and Maven
ARG MAVEN_VERSION=3.9.6
ARG JDK_VERSION=11

# Install OpenJDK and Maven
RUN apt-get update && \
    apt-get install -y openjdk-$JDK_VERSION-jdk && \
    apt-get clean

RUN mkdir /opt/maven && \
    wget -qO- "https://www.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" | tar -xzC /opt/maven --strip-components=1 && \
    ln -s /opt/maven/bin/mvn /usr/bin/mvn

# Set environment variables for Maven to reduce Maven footprint in CI logs
ENV MAVEN_OPTS="-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn"
ENV PATH="/opt/maven/bin:${PATH}"

# Set the working directory in the container (inherited from base, included here for clarity)
WORKDIR /usr/src/app

# Command to run when starting the container (inherited from base, included here for clarity)
CMD ["bash"]
