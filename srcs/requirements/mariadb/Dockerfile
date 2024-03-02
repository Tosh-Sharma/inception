FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt-get install mariadb-server -y
RUN apt-get install -y procps && rm -rf /var/lib/apt/lists/*

ENV SQL_DATABASE=test-db
ENV SQL_USER=mysql
ENV SQL_PASSWORD=helloPASSY1123
ENV SQL_ROOT_PASSWORD=rootyROOT123

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /etc/script.sh

# RUN mkdir -p /run/mysqld


# RUN mkdir -p /run/mysqld
# RUN touch /run/mysqld/mysqld.sock
# RUN touch /run/mysqld/mysqld.pid
RUN chmod +x /etc/script.sh

RUN ["/bin/sh", "/etc/script.sh"]

RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /var/run/mysqld

RUN chown -R mysql:mysql /run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /run/mysqld/mysqld.pid
RUN chmod -R 644 /run/mysqld/mysqld.sock

CMD ["mysqld", "--bind-address=0.0.0.0"]
