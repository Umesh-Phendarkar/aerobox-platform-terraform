variable "private_subnets" {
  type        = list(string)
  description = "Private subnet IDs for OpenSearch VPC access"
}

variable "os_sg" {
  type        = string
  description = "Security group ID for OpenSearch"
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
}
