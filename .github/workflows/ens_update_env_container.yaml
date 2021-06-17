name: Build and Push SCXA SolrCloud Image

on:
  push:
    paths:
      - "ensembl-update/Dockerfile"
      - "ensembl-update/tag"

jobs:
  test:
    name: Build image
    runs-on: ubuntu-20.04
    env:
      IMAGE_NAME: ensembl-update-env

    if: github.ref == 'refs/head/feature/**'
    steps:
    - uses: actions/checkout@v2

    - name: Read tag
      id: gettag
      run: echo "::set-output name=tag::$(head -n 1 ensembl-update/tag )"

    - name: Build image
      id: build-image
      uses: redhat-actions/buildah-build@v2
      with:
        image: ${{ env.IMAGE_NAME }}
        tags: latest ${{ steps.gettag.outputs.tag }}
        dockerfiles: |
          ./ensembl-update/Dockerfile
          
  deploy:
    name: Build and deploy image to quay.io/ebigxa
    runs-on: ubuntu-20.04
    env:
      IMAGE_NAME: ensembl-update-env

    if: github.ref == 'refs/heads/develop'
    steps:
    - uses: actions/checkout@v2

    - name: Read tag
      id: gettag
      run: echo "::set-output name=tag::$(head -n 1 ensembl-update/tag )"

    - name: Build image
      id: build-image
      uses: redhat-actions/buildah-build@v2
      with:
        image: ${{ env.IMAGE_NAME }}
        tags: latest ${{ steps.gettag.outputs.tag }}
        dockerfiles: |
          ./ensembl-update/Dockerfile
    
    - name: Push to Quay
      id: push-to-quay
      uses: redhat-actions/push-to-registry@v2
      with:
        image: ${{ steps.build-image.outputs.image }}
        tags: ${{ steps.build-image.outputs.tags }}
        registry: quay.io/ebigxa
        username: ${{ secrets.QUAY_USERNAME }}
        password: ${{ secrets.QUAY_TOKEN }}

    - name: Use the image
      run: echo "New image has been pushed to ${{ steps.push-to-quay.outputs.registry-paths }}"
