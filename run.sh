minikube start
eval $(minikube docker-env)
docker build . --tag giuliohome/fsharpcloud:v1.2.0
kubectl apply -f deploy.yml
kubectl get pod
kubectl get deploy
kubectl expose deployment cloud-deployment --type=LoadBalancer --name=cloud-service
kubectl port-forward svc/cloud-service 8080:5000