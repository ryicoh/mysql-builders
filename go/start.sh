#!/bin/sh

/entrypoint.sh mysqld &

for i in `seq 1 10`
do
  mysqladmin ping && \
    exec "$@" && \
    exit 0

  sleep 1
done

echo "mysql did not start within 10 seconds"
