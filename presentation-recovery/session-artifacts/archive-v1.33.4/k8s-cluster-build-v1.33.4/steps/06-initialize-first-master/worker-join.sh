#!/bin/bash
# Join command for worker nodes
kubeadm join 192.168.0.200:6443 --token 0t8r6k.idiqnf3tw95yggw7 \
	--discovery-token-ca-cert-hash sha256:4b39b4e58fbaddba3424dc38184cb11ee5bd0ae0578ffd763bde00921e8bdd46
