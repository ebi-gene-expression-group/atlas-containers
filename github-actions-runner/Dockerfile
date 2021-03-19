FROM quay.io/evryfs/github-actions-runner:ubuntu20-20201210.0-2.275.1
USER root
RUN apt-get update && \
    apt-get -y install gcc libpython3-dev && \
    apt-get -y clean && \
    rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo "runner ALL=(root) NOPASSWD: /usr/bin/apt-get*" > /etc/sudoers.d/runner
USER runner
