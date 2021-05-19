FROM solr:7.1.0

COPY index-bioentities /opt/scxa-solr-bootstrap/index-bioentities
COPY index-scxa /opt/scxa-solr-bootstrap/index-scxa

# We’ll start Solr to create the collections and run our scripts, and then we’ll shut it down
ENV SOLR_OPTS=-Denable.runtime.lib=true

WORKDIR /opt/scxa-solr-bootstrap/index-bioentities/bin
RUN /opt/solr/bin/solr start -c && \
./create-bioentities-collection.sh && \
./create-bioentities-schema.sh && \
./create-bioentities-suggesters-scxa.sh

ENV SCXA_ONTOLOGY=/opt/scxa-solr-bootstrap/index-scxa/bin/scatlas.owl
WORKDIR /opt/scxa-solr-bootstrap/index-scxa/bin
RUN /opt/solr/bin/solr start -c && \
./create-scxa-analytics-config-set.sh && \
./create-scxa-analytics-collection.sh && \
./create-scxa-analytics-biosolr-lib.sh && \
./create-scxa-analytics-schema.sh && \
./create-scxa-gene2experiment-config-set.sh && \
./create-scxa-gene2experiment-collection.sh && \
./create-scxa-gene2experiment-schema.sh

CMD ["/opt/solr/bin/solr", "start", "-f", "-c"]
