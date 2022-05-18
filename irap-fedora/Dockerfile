FROM nunofonseca/irap_fedora:v1.0.3

# Install time
RUN yum -y update && yum -y install time

# Add libtbb.so.2 and the appropriate libm.so.6 to LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/opt/irap/bin/salmon/lib/libtbb.so.2:/usr/lib64
