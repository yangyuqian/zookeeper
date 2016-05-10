#!/bin/bash
set -x

source init.sh
./reset.sh

ID=1
for host in $HOSTS
do
  ./zk/start.sh $host $ID
  ID=$((ID + 1))
done

ID=1
for host in $HOSTS
do
  ./mesos/master.sh $host $ID
  ID=$((ID + 1))
done

ID=1
for host in $HOSTS
do
  ./mesos/slave.sh $host $ID
  ID=$((ID + 1))
done

ID=1
for host in $HOSTS
do
  ./marathon/start.sh $host $ID
  ID=$((ID + 1))
done

# init-docker-client $KUBERNETES_MASTER_IP
# ./etcd/start.sh

# ./k8s/start.sh
