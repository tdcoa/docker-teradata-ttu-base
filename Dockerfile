FROM ubuntu:rolling

COPY TeradataToolsAndUtilitiesBase__ubuntu_indep.*.tar.gz /tmp/

RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install lib32stdc++6 ksh && \
    cd /tmp && \
    tar -xvaf TeradataToolsAndUtilitiesBase__ubuntu_indep.*.tar.gz && \
    TeradataToolsAndUtilitiesBase/setup.bat w && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf TeradataToolsAndUtilitiesBase && \
    rm -f TeradataToolsAndUtilitiesBase__ubuntu_indep.*.tar.gz \
    rm -f /*.deb

ENV ODBCINST /opt/teradata/client/ODBC_64/odbcinst.ini

EXPOSE 1025

CMD bash /opt/teradata/client/*/bin/ttulistproducts_unix.sh
