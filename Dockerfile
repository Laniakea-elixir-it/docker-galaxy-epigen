FROM laniakeacloud/galaxy-full:17.05

MAINTAINER ma.tangaro@ibiom.cnr.it

ENV container docker

COPY ["playbook.yaml","/"]

RUN ansible-galaxy install indigo_dc.galaxycloud-tools
RUN ansible-galaxy install indigo_dc.galaxycloud-tooldeps

RUN echo "localhost" > /etc/ansible/hosts

RUN ansible-playbook /playbook.yaml -e 'GALAXY_VERSION=release_17.05'

# This overwrite docker-galaxycloud CMD line
CMD /bin/mount -t cvmfs elixir-italy.galaxy.refdata /refdata/elixir-italy.galaxy.refdata; /usr/local/bin/galaxy-startup; /usr/bin/sleep infinity
