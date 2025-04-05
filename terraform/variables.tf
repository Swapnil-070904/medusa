variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "db_username" {
  description = "Username for the database"
}

variable "db_password" {
  sensitive = true
}

variable "image_url" {
  description = "URL of the container image in ECR"
}
variable "jwt_secret_arn" {
  description = "ARN of the SSM parameter containing the JWT secret"
}
variable "cookie_secret_arn" {
  description = "ARN of the SSM parameter containing the cookie secret"
}

variable "ecs_exec_role_arn" {
  description = "value of the ECS execution role ARN"
}
