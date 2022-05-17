FROM nunofonseca/irap_fedora:v1.0.3

# Install time
RUN yum -y update && yum -y install time

# Add libtbb.so.2 to LD_LIBRARY_PATH
RUN export LD_LIBRARY_PATH=/opt/irap/bin/salmon/lib:$LD_LIBRARY_PATH