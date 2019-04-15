#!/usr/bin/env bash

source refstack-client/.venv/bin/activate

resultfile=$(find refstack-client/.tempest/.stestr -name 'betacloud-2018.11-*.json' | sort -r | head -n1)
refstack-client upload $resultfile --url https://refstack.openstack.org/api -i id_rsa.refstack -y
