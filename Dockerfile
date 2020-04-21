FROM mongo:4.0.17

WORKDIR /docker-entrypoint-initdb.d

COPY ./000_user.sh 000_user.sh
RUN chmod u+x 000_user.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 27017

CMD ["mongod"]
