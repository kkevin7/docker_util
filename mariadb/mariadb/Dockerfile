FROM bitnami/mariadb:latest

ENV MYSQL_DATABASE=cinedb
ADD /cinedb.sql /docker-entrypoint-initdb.d/cinedb.sql
ENV MYSQL_DATABASE=prestamos
ADD /prestamosv3.sql /docker-entrypoint-initdb.d/prestamosv3.sql