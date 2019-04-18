#!/usr/bin/env bash

git clone https://github.com/openstack/refstack-client
pushd refstack-client
./setup_env
popd

GUIDELINE=2018.11

curl -s "https://refstack.openstack.org/api/v1/guidelines/$GUIDELINE/tests?target=compute&type=required,advisory&alias=true&flag=true" | grep -v tempest.api.identity.v3.test_projects.IdentityV3ProjectsTest.test_list_projects_returns_only_authorized_projects > test-list.txt
