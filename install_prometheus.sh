kubectl create namespace monitoring

# Add prometheus-community repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Update helm repo
helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring

kubectl get pods -n monitoring
