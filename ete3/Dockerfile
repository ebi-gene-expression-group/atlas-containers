FROM mambaorg/micromamba:2.8.1-debian12-slim

RUN micromamba create -y -n ete3 \
    -c conda-forge \
    -c bioconda \
    python=3.10 \
    ete3 && \
    micromamba clean --all --yes

ENV PATH=/opt/conda/envs/ete3/bin:$PATH
ENV CONDA_DEFAULT_ENV=ete3

RUN python -c "from ete3 import NCBITaxa; print('ETE3 OK')"