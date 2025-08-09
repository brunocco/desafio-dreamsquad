variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "desafio-dreamsquad-bruno-2025"
}

variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}
