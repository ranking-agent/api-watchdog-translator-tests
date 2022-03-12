# leverage the renci python base image
FROM renciorg/renci-python-image:v0.0.1

# make a directory for the repo
RUN mkdir /api-watchdog

# go to the directory where we are going to download the repo
WORKDIR /download

# get the "latest" code, this must update to the latest the api-watchdog release
RUN wget https://github.com/ranking-agent/api-watchdog/archive/refs/tags/v0.3.2.zip -O api-watchdog.zip
RUN unzip -o api-watchdog.zip -d /api-watchdog

# this must also update to the latest the api-watchdog release tag
WORKDIR /api-watchdog/api-watchdog-0.3.2

# make sure all is writeable for the nru USER later on
RUN chmod -R 777 .

# install requirements
RUN pip install .[TRAPI]

# Make a folder to put the fetch and exec script
RUN mkdir /sandbox
WORKDIR /sandbox
COPY ./fetch-and-exec.sh /sandbox/fetch-and-exec.sh

# make sure all is writeable for the nru USER later on
RUN chmod -R 777 .

# switch to the non-root user (nru). defined in the base image
USER nru

WORKDIR /sandbox
