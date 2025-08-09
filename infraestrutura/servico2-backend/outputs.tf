output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

output "private_subnets" {
  value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "security_group_ids" {
  value = [aws_security_group.alb_sg.id, aws_security_group.ecs_sg.id]
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.backend_cluster.id
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.backend_task.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.backend_service.name
}

output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "DNS público do Application Load Balancer"
}


