# Galaxy - Epigen

FROM bgruening/galaxy-stable:19.01

MAINTAINER Tangaro Marco Antonio, ma.tangaro@ibiom.cnr.it

ENV GALAXY_CONFIG_BRAND="Epigen"

WORKDIR /galaxy-central

RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/galaxy-ngs-base.yml -O $GALAXY_ROOT/tools1.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_bedtools.yml -O $GALAXY_ROOT/tools2.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_DEEPtools.yml -O $GALAXY_ROOT/tools3.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_mapping.yml -O $GALAXY_ROOT/tools4.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_peakcalling.yml -O $GALAXY_ROOT/tools5.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_QCandmanipulation.yml -O $GALAXY_ROOT/tools6.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_RNAanalysis.yml -O $GALAXY_ROOT/tools7.yaml
RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-epigen/NGS_samtools.yml  -O $GALAXY_ROOT/tools8.yaml


RUN install-tools $GALAXY_ROOT/tools1.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools2.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools3.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools4.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools5.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools6.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools7.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

RUN install-tools $GALAXY_ROOT/tools8.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    rm /export/galaxy-central/ -rf

# Install workflows
#RUN mkdir -p $GALAXY_HOME/workflows
#
#RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-CoVaCS/galaxy-CoVaCS-workflows/Galaxy-Workflow-CoVaCS.ga -O $GALAXY_HOME/workflows/Galaxy-Workflow-CoVaCS.ga
#RUN wget https://raw.githubusercontent.com/indigo-dc/Galaxy-flavors-recipes/master/galaxy-CoVaCS/galaxy-CoVaCS-workflows/Galaxy-Workflow-covacs_wf_Select_variant.ga -O $GALAXY_HOME/workflows/Galaxy-Workflow-covacs_wf_Select_variant.ga
#
#RUN startup_lite && \
#    galaxy-wait && \
#    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD

# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
