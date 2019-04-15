#!/usr/bin/env bash

git clone https://github.com/openstack/refstack-client
pushd refstack-client
./setup_env
popd

wget "https://refstack.openstack.org/api/v1/guidelines/2018.11/tests?target=compute&type=required,advisory&alias=true&flag=true" -O 2018.11-test-list.txt
