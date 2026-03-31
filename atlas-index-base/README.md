# atlas-index-base image

This image is used by experiment data loading pipelines via the atlas cli.

Order of development:

1. change code in atlas web bulk repo
2. push to develop branch. 
3. tag the build x.y.z-cli
4. change version number in `atlas-conda/recipes/atlas-web-bulk-cli/meta.yaml`: `version=...`
5. push to master branch 
6. a [GitHub Action](https://github.com/ebi-gene-expression-group/atlas-conda/actions/workflows/build_upon_pullrequest.yml) creates a new version and pushes to anaconda repo: <https://anaconda.org/channels/ebi-gene-expression-group/packages/atlas-web-bulk-cli/overview>
7. change version number of atlas-web-bulk-cli in `atlas-containers/atlas-index-base/templated-conda-env.yaml`: `atlas-web-bulk-cli=...`
8. increment version in image_tag
9. push to master
10. an image is push to <https://quay.io/repository/ebigxa/atlas-index-base>
11. Update clients of the image, e.g. `wf-bulk-indexing/Snakemake`
