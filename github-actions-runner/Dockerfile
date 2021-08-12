FROM quay.io/evryfs/github-actions-runner:ubuntu20-20210628.1-2.278.0

USER root
RUN sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com && \
    apt-get update && \
    apt-get -y install gcc libpython3-dev && \
    apt-get -y clean && \
    rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Update latest runner
ARG RUNNER_VERSION=2.280.2
RUN curl -sL "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" | tar xzvC /home/runner && \
    /home/runner/bin/installdependencies.sh

RUN echo "runner ALL=(root) NOPASSWD: /usr/bin/apt-get*" > /etc/sudoers.d/runner
USER runner
