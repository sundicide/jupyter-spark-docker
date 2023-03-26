FROM continuumio/anaconda3:latest

MAINTAINER ian.shiundu@gmail.com

ENV PATH="${PATH}:/opt/conda/bin"

# Install Jupyter, Java & Spark

RUN /opt/conda/bin/conda install openjdk=8.0.152 jupyter -y --quiet

RUN sed -i 's/buster/oldstable/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y curl

RUN curl -L -O --progress-bar http://archive.apache.org/dist/spark/spark-3.2.3/spark-3.2.3-bin-hadoop2.7.tgz
RUN tar -xf spark-3.2.3-bin-hadoop2.7.tgz

# Copy files

COPY jupyter_notebook_config.py /jupyter_notebook_config.py

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY kernel.json /kernel.json

COPY toree/ /toree/
RUN chmod +x /toree/bin/run.sh

# Setup and run

VOLUME /config
VOLUME /notebooks
VOLUME /data

EXPOSE 8888

CMD ["sh", "/setup.sh"]