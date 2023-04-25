#!/bin/sh
docker rmi -f localhost/ee-rh-sm 2>/dev/null && \
rm -rf context && \
ansible-builder create && \
cp -r collections/ansible_collections/redhat context/_build/redhat && \
ansible-builder build --tag localhost/ee-rh-sm --container-runtime docker