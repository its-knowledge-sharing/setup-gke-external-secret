
#!/bin/bash

# Intend to deploy to "default" namespae

kubectl delete -f pods/test-pod.yaml
kubectl apply -f pods/test-pod.yaml
