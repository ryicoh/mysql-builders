#!/bin/sh

/entrypoint.sh mysqld &

num_attempt=30
num_connected=0
success_threshold=3

for i in `seq 1 $num_attempt`; do
  if mysqladmin ping -h 127.0.0.1 &> /dev/null; then
    num_connected=$(($num_connected+1))

    if [[ $num_connected == $success_threshold ]]; then
        exec "$@"
        exit 0
    fi
  fi

  sleep 1
done

echo "mysql did not start within $num_attempt seconds"
exit 1
