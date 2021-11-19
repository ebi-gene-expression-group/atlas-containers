# Atlas containers

This is a repo for the creation logic of containers that serve as environments for different
Atlas tasks (like talking to databases, to indexes, user perl atlas modules, etc).

The motivations for this repo are:
- Reduce testing time on the CIs by having prebuilt containers
- Enable group members to run under specific environments easily
- Providing some static conda environments within containers to avoid the deterioration
that potential conda environments installations suffer in time.
- Unifying the way that we handle CIs for containers
- Having containers for combinations of conda packages that are outside of the
bioconda/conda-forge realm (such as those in our group anaconda channel).

# Writing standardised micromamba containers

The preferred way to add containers to this repo is to follow the micromamba
approach used for atlas-index-base or atlas-schema-base, among others. That means
inside the new directory for the container include:

- env.yaml : an standard conda environments file, with the specific channels and packages needed.
- image_tag : a simple text file with a single line that contains the image name and tag desired. Everytime that you modify the container, you should change the tag, as this will be used to push to quay.io to https://quay.io/organization/ebigxa
- post_install_dockerfile : **Optional** 
