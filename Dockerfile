FROM sebp/elk:651

ENV ES_HOME /opt/elasticsearch
WORKDIR ${ES_HOME}

RUN yes | CONF_DIR=/etc/elasticsearch gosu elasticsearch bin/elasticsearch-plugin \
    install -b ingest-geoip
RUN yes | CONF_DIR=/etc/elasticsearch gosu elasticsearch bin/elasticsearch-plugin \
    install -b ingest-user-agent
RUN yes | CONF_DIR=/etc/elasticsearch gosu elasticsearch bin/elasticsearch-plugin \
    install -b com.floragunn:search-guard-6:6.5.1-24.1
RUN chmod +x plugins/search-guard-6/tools/install_demo_configuration.sh
RUN ./plugins/search-guard-6/tools/install_demo_configuration.sh
