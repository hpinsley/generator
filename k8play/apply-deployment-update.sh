set -x
kubectl apply -f deployment.yaml --record
kubectl get deploy hello-deploy
kubectl get rs
#kubectl rollout status deployment hello-deploy
