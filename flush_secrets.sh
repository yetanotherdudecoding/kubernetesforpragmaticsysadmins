kubectl get secrets -n kube-system | awk '{print $1}' | grep -v NAME | xargs kubectl delete secret -n kube-system
kubectl get secrets | awk '{print $1}' | grep -v NAME | xargs kubectl delete secret
