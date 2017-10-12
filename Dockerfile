FROM broadinstitute/scala-baseimage:latest

RUN apt-get update && apt-get install -y git

# Fetch the branch and checkout commit 
RUN mkdir -p /nlp

# Fetch the branch and checkout commit 
RUN cd /nlp && git clone -b master https://github.com/clulab/reach.git
WORKDIR /nlp/reach
RUN git checkout 72064c6abb442bfa84cc89e0f00fb50c3a9ffa6c 

# Make changes to the configuration files.
# Set default timeouts 
RUN sed -i.bak 's/askTimeout = .*/askTimeout = 1200/' /nlp/reach/main/src/main/resources/application.conf
# Listen on host 0.0.0.0 
RUN sed -i.bak 's/localhost/0\.0\.0\.0/' /nlp/reach/export/src/main/resources/reference.conf

# Compile a FAT JAR configured to run the file processor server
RUN sbt -DmainClass=org.clulab.reach.export.server.ApiServer assembly

EXPOSE 8080
COPY sbt.sh /

# Run as unprivileged pcuser
RUN groupadd -r pcuser_grp && useradd -r -m -d /home/pcuser/ -s /bin/bash -g pcuser_grp pcuser
RUN chown pcuser:pcuser_grp /nlp/reach/target/scala-2.11/reach-1.3.5-SNAPSHOT-FAT.jar
USER pcuser
ENV HOME /home/pcuser
RUN mkdir -p /home/pcuser/Documents/reach

WORKDIR /nlp/reach/target/scala-2.11
CMD ["/sbt.sh"]
