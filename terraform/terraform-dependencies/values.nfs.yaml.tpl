# Default values for nfs-provisioner.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

# imagePullSecrets:

image:
  repository: ${image_repository}
  tag: ${image_tag}
  pullPolicy: ${pull_policy}


# For a list of available arguments
# Please see https://github.com/kubernetes-incubator/external-storage/blob/master/nfs/docs/deployment.md#arguments
extraArgs: {}
  # device-based-fsids: false

service:
  type: ClusterIP

  nfsPort: 2049
  nlockmgrPort: 32803
  mountdPort: 20048
  rquotadPort: 875
  rpcbindPort: 111
  statdPort: 662
  # nfsNodePort:
  # nlockmgrNodePort:
  # mountdNodePort:
  # rquotadNodePort:
  # rpcbindNodePort:
  # statdNodePort:

  externalIPs: []

persistence:
  enabled: true

  ## Persistent Volume Storage Class
  ## If defined, storageClassName: <storageClass>
  ## If set to "-", storageClassName: "", which disables dynamic provisioning
  ## If undefined (the default) or set to null, no storageClassName spec is
  ##   set, choosing the default provisioner.  (gp2 on AWS, standard on
  ##   GKE, AWS & OpenStack)
  ##
  storageClassName: "standard"
  accessMode: ReadWriteOnce
  size: ${nfs_size}

## For creating the StorageClass automatically:
storageClass:
  create: true

  ## Set a provisioner name. If unset, a name will be generated.
  # provisionerName:

  ## Set StorageClass as the default StorageClass
  ## Ignored if storageClass.create is false
  defaultClass: false

  ## Set a StorageClass name
  ## Ignored if storageClass.create is false
  name: nfs

  # set to null to prevent expansion
  allowVolumeExpansion: true
  ## StorageClass parameters
  parameters: {}

  mountOptions:
    - vers=3

  ## ReclaimPolicy field of the class, which can be either Delete or Retain
  reclaimPolicy: Delete

## For RBAC support:
rbac:
  create: true

  ## Ignored if rbac.create is true
  ##
  serviceAccountName: default

resources: {}
  # limits:
  #  cpu: 100m
  #  memory: 128Mi
  # requests:
  #  cpu: 100m
  #  memory: 128Mi

nodeSelector: {}

tolerations: []

affinity: {}