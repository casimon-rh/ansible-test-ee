#!/bin/sh
ansible-navigator run wait.yaml --eei localhost/ee-rh-sm --pp never \
  --pae false -m stdout