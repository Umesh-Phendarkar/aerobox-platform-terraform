variable "ami" {
  type        = string
  description = "AMI ID"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet IDs for EC2"
}

variable "app_sg" {
  type        = string
  description = "Application security group ID"
}

variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN"
}

variable "project_name" {
  type        = string
}

variable "public_key_path" {
  type        = string
  description = "Path to public key file (.pem)"
}
