FROM mysql:5.7 as mysql
FROM gcr.io/cloud-builders/go:debian

ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

RUN apt update && \
    apt install -qy gosu && \
    groupadd -r mysql && \
    useradd -r -g mysql mysql && \
    mkdir /var/lib/mysql-files && \
    mkdir /var/run/mysqld/ && \
    chown mysql:mysql /var/run/mysqld && \
    mkdir /docker-entrypoint-initdb.d

COPY ./my.cnf /etc/mysql/my.cnf
COPY ./start.sh /start.sh

COPY --from=mysql /usr/bin/mysql /usr/bin
COPY --from=mysql /usr/sbin/mysqld /usr/sbin
COPY --from=mysql /usr/bin/mysqladmin /usr/bin
COPY --from=mysql /usr/bin/mysql_install_db /usr/bin
COPY --from=mysql /usr/bin/mysql_tzinfo_to_sql /usr/bin

COPY --from=mysql /usr/lib/x86_64-linux-gnu/libaio.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=mysql /usr/lib/x86_64-linux-gnu/libnuma.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=mysql /usr/share/mysql /usr/share/mysql 
COPY --from=mysql /entrypoint.sh /entrypoint.sh

WORKDIR  /app

USER root

ENTRYPOINT ["/start.sh"]
