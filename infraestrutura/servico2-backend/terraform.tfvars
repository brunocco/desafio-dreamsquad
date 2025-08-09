region           = "us-east-1"

vpc_cidr_block   = "10.0.0.0/16"
public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

ecs_cluster_name = "backend-cluster"
app_name         = "backend-app"

container_name   = "backend-container"
container_port   = 80

ecr_repo_name    = "backend-api"
