FROM laniakeacloud/galaxy-epigen:ngs-rnaanalysis

MAINTAINER ma.tangaro@ibiom.cnr.it

ENV container docker

RUN echo "localhost" > /etc/ansible/hosts

RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_samtools.yml  -O /tmp/tools.yml

ADD https://raw.githubusercontent.com/Laniakea-elixir-it/Scripts/master/galaxy_tools/install_tools.docker.sh /tmp/install_tools.sh
RUN chmod +x /tmp/install_tools.sh

RUN /tmp/install_tools.sh GALAXY_ADMIN_API_KEY /tmp/tools.yml && \
    /export/tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null

# This overwrite docker-galaxycloud CMD line
CMD /usr/local/bin/galaxy-startup; /usr/bin/sleep infinity
