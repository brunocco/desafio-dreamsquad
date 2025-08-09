resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/backend-service"
  retention_in_days = 7
}
