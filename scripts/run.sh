#!/usr/bin/env bash

source refstack-client/.venv/bin/activate

refstack-client test -s -c tempest.conf --test-list /home/travis/build/betacloud/test-refstack/test-list.txt -r betacloud
