FROM markthebault/spark:spark-2.2.1-hadoop2.7.0

WORKDIR /usr/
ENV VERSION 0.5.0
ENV URL http://apache.lauf-forum.at/incubator/livy/${VERSION}-incubating/livy-${VERSION}-incubating-bin.zip

RUN curl -o livy.zip $URL \
    && unzip livy.zip \
    && rm livy.zip \
    && mv livy* livy 

#ADD defaults/* defaults/
COPY ./conf/ /usr/livy/conf/

EXPOSE 8998
CMD ["/bin/bash","-c", "/usr/livy/bin/livy-server start; tail -f /usr/livy/logs/livy--server.out"]