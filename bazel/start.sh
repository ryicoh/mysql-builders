#!/bin/sh

/entrypoint.sh mysqld &

for i in `seq 1 20`
do
  mysqladmin ping && \
    exec "$@" && \
    exit 0

  sleep 1
done

echo "mysql did not start within 20 seconds"
exit 1
