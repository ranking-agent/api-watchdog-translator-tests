FROM python:3.9.7

# We need permisions to apt-get and access directories
RUN apt-get update
RUN apt-get install -yq vim
RUN pip install 'api-watchdog[TRAPI]'

# For security reasons we do not run as root
RUN groupadd -g 1001 watchdog
RUN useradd --no-create-home watchdog -s /bin/false -u 1001 -g watchdog
RUN mkdir /sandbox
RUN chgrp watchdog /sandbox
RUN chmod g+rwx /sandbox
COPY ./fetch-and-exec.sh /sandbox/fetch-and-exec.sh
USER watchdog

WORKDIR /sandbox

