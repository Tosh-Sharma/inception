FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /etc/script.sh

# RUN mkdir -p /run/mysqld
# RUN chown -R mysql:mysql /run/mysqld
# RUN chmod 777 /var/run/mysqld

RUN mkdir -p /run/mysqld
RUN touch /run/mysqld/mysqld.sock
RUN touch /run/mysqld/mysqld.pid
RUN chown -R mysql:mysql /run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /run/mysqld/mysqld.pid
RUN chmod -R 644 /run/mysqld/mysqld.sock

RUN ["/bin/sh", "/etc/script.sh"]

# CMD ["mariadb"]


#  error: 'Can't connect to local MySQL server through socket '/run/mysqld/mysqld.sock'

#  => => # Check that mysqld is running and that the socket: '/run/mysqld/mysqld.sock' exists! 
#  => => # 240229 17:53:15 mysqld_safe Logging to syslog.                                      
#  => => # 240229 17:53:15 mysqld_safe Starting mariadbd daemon with databases from /var/lib/my
#  => => # sql