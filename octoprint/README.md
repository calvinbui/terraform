Available at https://app.terraform.io/app/calvin/workspaces/octoprint

ILM will need to be applied manually:

```console
$ docker exec -it minio-mc bash

[root@minio-mc /]# mc ilm import minio/octoprint << EOF
<contents of minio-ilm.json>
EOF

[root@minio-mc /]# mc ilm ls minio/octoprint
```
