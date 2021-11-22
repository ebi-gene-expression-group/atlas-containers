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
inside the new directory for the container includes:

- **templated-conda-env.yaml** : an standard conda environments file, with the specific channels and packages needed.
- **image_tag** : a simple text file with a single line that contains the image name and tag desired. Everytime that you modify the container, you should change the tag, as this will be used to push to quay.io to https://quay.io/organization/ebigxa
- **post_install_dockerfile** : **Optional** file with any docker lines to be added at the end of the Dockerfile being dynamically created

The Dockerfile will then be dynamically created by the CI in `conda-templated.yaml` based on the above.

Before merging into master, make sure that the container project exists within the `ebigxa` organization in [quay.io](https://quay.io/organization/ebigxa). If it doesn't, create an **empty** repository with the appropiate name (see the image_tag file) by clicking on `+ Create new repository` and selecting empty as the type of project and making sure it is public. Then go to the [robot config](https://quay.io/organization/ebigxa?tab=robots) and make sure that ebigxa+atlas_containers has write access on that repository (by clicking the `n repositories` row for that entry.)

This is mostly meant for containers that are "environment" containers, where the script/execution logic of specific processes will be mounted.

You are of course free to use different approaches for specific use cases that don't fit this design, but then that will require its own CI.
