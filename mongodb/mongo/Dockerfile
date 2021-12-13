FROM mongo:latest

COPY mongo.conf.orig /etc/mongod.conf.orig

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]
