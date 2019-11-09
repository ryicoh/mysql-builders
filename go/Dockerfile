FROM gcr.io/cloud-builders/go

WORKDIR  /app
RUN apk add -u --no-cache mysql mysql-client

COPY ./start.sh /start.sh
COPY ./my.cnf /etc/mysql/my.cnf

ENTRYPOINT ["/start.sh"]
