# OctoPrint

## Terraform State

Available at https://app.terraform.io/app/calvin/workspaces/octoprint


## ILM

ILM will need to be applied manually:

```console
$ docker exec -it minio-mc bash

[root@minio-mc /]# mc ilm import minio/octoprint << EOF
<contents of minio-ilm.json>
EOF

[root@minio-mc /]# mc ilm ls minio/octoprint
```

Issue: https://github.com/aminueza/terraform-provider-minio/issues/97

## Access and Secret Key

Can be found in the state: https://app.terraform.io/app/calvin/workspaces/octoprint/states
