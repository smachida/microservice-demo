#!/bin/bash
VM_IP=`kubectl get virtualmachines/$1 -o jsonpath='{.status.vmIp}'`
echo $VM_IP

export VM_IP
kubectl exec -it jumpbox -- /usr/bin/ssh vmware-system-user@$VM_IP

