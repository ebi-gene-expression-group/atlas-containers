FROM mambaorg/micromamba:0.17.0

COPY --chown=micromamba:micromamba templated-conda-env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes
