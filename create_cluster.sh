eksctl create cluster -f eksworkshop.yaml

# Test the cluster

kubectl get nodes # if we see our 3 nodes, we know we have authenticated correctly

aws eks update-kubeconfig --name eksworkshop-eksctl --region ${AWS_REGION}

# Export Worker role name 

STACK_NAME=$(eksctl get nodegroup --cluster eksworkshop-eksctl -o json | jq -r '.[].StackName')
ROLE_NAME=$(aws cloudformation describe-stack-resources --stack-name $STACK_NAME | jq -r '.StackResources[] | select(.ResourceType=="AWS::IAM::Role") | .PhysicalResourceId')
echo "export ROLE_NAME=${ROLE_NAME}" | tee -a ~/.bash_profile
