variable "region" {}
variable "az1" {}
variable "az2" {}
variable "ami" {}
variable "project_name" {}
variable "public_key_path" {
  description = "Path to public key file"
  type        = string
}

variable "vpc_cidr" {}
variable "public_cidr_blocks" {
  type = list(string)
}
variable "private_cidr_blocks" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
