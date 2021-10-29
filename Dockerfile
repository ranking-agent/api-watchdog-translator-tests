FROM python:3.9.7
RUN apt-get update
RUN apt-get install -yq vim
COPY ./fetch-and-exec.sh ./fetch-and-exec.sh
RUN pip install 'api-watchdog[TRAPI]'
