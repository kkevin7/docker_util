FROM mysql:latest

COPY mysql/conf/mysql_conf.cnf  /etc/mysql/conf.d/mysql_conf.cnf

VOLUME [/var/lib/mysql]
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3306 33060
CMD ["mysqld"]