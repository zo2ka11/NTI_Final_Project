ECR_REGION=us-east-1
ECR_ACCOUNT_ID=730335480302
SECRET_NAME=ecr-secret
TOKEN=$(aws ecr get-login-password --region $ECR_REGION)

kubectl create secret  docker-registry $SECRET_NAME \
  --docker-server=$ECR_ACCOUNT_ID.dkr.ecr.$ECR_REGION.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$TOKEN