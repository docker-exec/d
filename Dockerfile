FROM        debian:8.0
MAINTAINER  andystanton
ENV         LANG C.UTF-8
ENV         D_VERSION 2.067.0
RUN         apt-get update -qq -y && \
            apt-get install -y patch wget libc6-dev gcc xdg-utils libcurl3 && \
            wget http://downloads.dlang.org/releases/2.x/${D_VERSION}/dmd_${D_VERSION}-0_amd64.deb && \
            dpkg -i dmd_${D_VERSION}-0_amd64.deb && \
            apt-get remove -y wget && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD         image-common /tmp/dexec/image-common
VOLUME      /tmp/dexec/build
ENTRYPOINT  ["/tmp/dexec/image-common/dexec-script.sh", "rdmd"]
