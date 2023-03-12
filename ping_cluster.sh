#!/bin/bash

# set the Redshift cluster endpoint
cluster_endpoint="my-redshift-cluster-b6.cttv5bt8qqs7.us-east-1.redshift.amazonaws.com:5439"

# ping the cluster with 3 attempts and a timeout of 5 seconds
ping -c 3 -W 5 $cluster_endpoint

# check the exit code of the ping command
if [ $? -eq 0 ]; then
  echo "Redshift cluster is up and running!"
else
  echo "Unable to ping Redshift cluster"
fi
