variable "private_subnets" {
  type        = list(string)
  description = "Private subnet IDs for Redis"
}

variable "redis_sg" {
  type        = string
  description = "Security group ID for Redis"
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
}
