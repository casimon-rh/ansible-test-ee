
replicaCount: 1

image:
  baserepository: image-registry.openshift-image-registry.svc:5000
  repository: "{{ item.name }}"
  tag: ""
  baseimage: 'nodejs-18'
  baseimagetag: 'latest'
  baseimagerepo: registry.access.redhat.com/ubi9
  createbaseimage: true

nameOverride: ""
fullnameOverride: ""
runbuild: true

podAnnotations:
  sidecar.istio.io/inject: 'true'

service:
  type: ClusterIP
  port: 3000

resources:
  limits:
    cpu: '2'
    memory: 5G
  requests:
    cpu: 10m
    memory: 50m

repo: 'https://github.com/casimon-rh/gs-nodejs-demo2'

environment:
- name: CHAIN_SVC
  value: "http://{{ item.next }}-mesh-element:3000/chain"
- name: ID
  value: "{{ item.name }}"
- name: NEXT_SVC
  value: 'http://{{ item.next }}-mesh-element:3000'
- name: JUMPS
  value: '12'

wildcard: .apps.cluster-s8c5v.s8c5v.sandbox3107.opentlc.com

servicemesh:
  create: true
  gateway:
    create: true
  subsets:
  - labels:
      version: v1
    name: v1