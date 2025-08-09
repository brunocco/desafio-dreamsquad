resource "aws_ecr_repository" "backend_api" {
  name         = "backend-api"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
    Name        = "backend-api"
  }
}
