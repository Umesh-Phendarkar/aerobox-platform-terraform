region          = "ap-south-1"
az1             = "ap-south-1a"
az2             = "ap-south-1b"
ami             = "ami-0f58b397bc5c1f2e8"
project_name    = "aerobox-dev-feb-2026"
public_key_path = "allnew.pem.pub"
vpc_cidr        = "10.0.0.0/16"

public_cidr_blocks = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_cidr_blocks = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]

azs = [
  "ap-south-1a",
  "ap-south-1b"
]
