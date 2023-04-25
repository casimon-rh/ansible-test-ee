#!/bin/sh
ansible-navigator run test.yaml --eei localhost/ee-rh-sm --pp never \
  --pae false -m stdout