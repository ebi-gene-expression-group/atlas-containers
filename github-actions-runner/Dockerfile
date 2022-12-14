FROM quay.io/evryfs/github-actions-runner:master

USER root
RUN sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com && \
    apt-get update && \
    apt-get -y install gcc libpython3-dev && \
    apt-get -y clean && \
    rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Update latest runner
ARG RUNNER_VERSION=2.300.0
RUN curl -sL "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" | tar xzvC /home/runner && \
    /home/runner/bin/installdependencies.sh

# there is now an addition for this on the upstream container, added 09/2021
# https://github.com/evryfs/github-actions-runner/blob/master/Dockerfile#L28
# RUN echo "runner ALL=(root) NOPASSWD: /usr/bin/apt-get*" > /etc/sudoers.d/runner
USER runner
