set -x
kubectl create -f deployment.yaml
kubectl describe deploy hello-deploy
kubectl get rs
