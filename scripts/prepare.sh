#!/usr/bin/env bash

git clone https://github.com/openstack/refstack-client
pushd refstack-client
./setup_env
popd

GUIDELINE=2018.11

curl -s "https://refstack.openstack.org/api/v1/guidelines/$GUIDELINE/tests?target=compute&type=required,advisory&alias=true&flag=true" | \
    grep -v tempest.api.identity.v3.test_projects.IdentityV3ProjectsTest.test_list_projects_returns_only_authorized_projects | \
    grep -v "tempest.api.compute.servers.test_list_server_filters.ListServerFiltersTestJSON.test_list_servers_filtered_by_ip_regex" \
    > test-list.txt

wget https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc

./mc config host add betacloud https://files.betacloud.de $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
