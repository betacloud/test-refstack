#!/usr/bin/env bash

source refstack-client/.venv/bin/activate

resultfile=$(find refstack-client/.tempest/.stestr -name 'betacloud-*.json' | sort -r | head -n1)

PUSH_TO_REFSTACK=${PUSH_TO_REFSTACK:-false}
if [[ $PUSH_TO_REFSTACK == "true" ]]; then
    refstack-client upload $resultfile --url https://refstack.openstack.org/api -i id_rsa.refstack -y
fi
