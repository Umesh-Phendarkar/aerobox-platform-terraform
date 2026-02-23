variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "public_cidr_blocks" {
  type        = list(string)
  description = "Public subnet CIDR blocks"
}

variable "private_cidr_blocks" {
  type        = list(string)
  description = "Private subnet CIDR blocks"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
