variable "private_subnets" {
  type        = list(string)
  description = "Private subnet IDs for RDS subnet group"
}

variable "db_sg" {
  type        = string
  description = "Security group ID for RDS"
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
}
