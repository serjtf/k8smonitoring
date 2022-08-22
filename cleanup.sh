### CLEANUP ####

helm uninstall prometheus --namespace monitoring
kubectl delete ns monitoring

eksctl delete cluster --name=eksworkshop-eksctl
