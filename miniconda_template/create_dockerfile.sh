#!/usr/bin/env bash

cat miniconda_template/Dockerfile $1/post_install_dockerfile > $1/Dockerfile
