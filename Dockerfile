#Maven image with IBM JDK

FROM ibmjava:8-sdk

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget unzip ca-certificates swig \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

#install Maven
ENV MVN_VERSION 3.6.0
RUN wget -q http://www.nic.funet.fi/pub/mirrors/apache.org/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.zip
RUN unzip -q apache-maven-${MVN_VERSION}-bin.zip \
    && mv /apache-maven-${MVN_VERSION} /maven 

#add maven/bin to PATH
ENV PATH /maven/bin:$PATH

CMD ["/bin/bash"]
