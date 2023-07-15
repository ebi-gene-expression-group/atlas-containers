#!/usr/bin/env bash

dockerfile=miniconda_template/Dockerfile
if [ -f "$1/pre_install_dockerfile" ]; then
    dockerfile=$1/pre_install_dockerfile
fi
cat $dockerfile > $1/Dockerfile

if [ -f "$1/post_install_dockerfile" ]; then
  cat $1/post_install_dockerfile >> $1/Dockerfile
fi
