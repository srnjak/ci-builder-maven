# Use the specified Maven version as a build argument
ARG MAVEN_VERSION=3.9.6

FROM maven:${MAVEN_VERSION}

# Update package lists and install SSH, GnuPG, and additional utilities
RUN apt-get update && apt-get install -y \
    ssh \
    gnupg2 \
    expect

# Set GPG to use loopback mode for passphrase input
RUN echo "use-agent" >> /root/.gnupg/gpg.conf && \
    echo "pinentry-mode loopback" >> /root/.gnupg/gpg.conf && \
    echo "allow-loopback-pinentry" >> /root/.gnupg/gpg-agent.conf

# Restart GPG-Agent to apply configuration changes
RUN echo RELOADAGENT | gpg-connect-agent

# Ensure correct permissions on the .gnupg directory
RUN chown -R root:root /root/.gnupg/ && \
    chmod 700 /root/.gnupg
