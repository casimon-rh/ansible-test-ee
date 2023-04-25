#!/bin/sh
docker rmi -f localhost/ee-rh-sm 2>/dev/null && \
rm -rf exec-env/context && \
ansible-builder create -c exec-env/context -f exec-env/execution-environment.yml && \
cp -r collections/ansible_collections/redhat exec-env/context/_build/redhat && \
cp _ansible.cfg exec-env/context/_build/ansible.cfg && \
ansible-builder build --tag localhost/ee-rh-sm --container-runtime docker -f exec-env/execution-environment.yml -c exec-env/context