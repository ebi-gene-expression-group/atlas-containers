FROM openjdk:8u292-jre

RUN apt-get update -y && apt-get install -y git default-mysql-client perl

ENV SCALA_VERSION 2.12
ENV AMM_VERSION 1.1.2
ENV AMM_FILE $SCALA_VERSION-$AMM_VERSION
ENV AMM_URL https://github.com/lihaoyi/Ammonite/releases/download/$AMM_VERSION/$AMM_FILE

RUN curl -L "$AMM_URL" | (echo '#!/usr/bin/env sh' && cat) > /usr/local/bin/amm \
 && chmod +x "/usr/local/bin/amm"

RUN amm -c ""

CMD amm
