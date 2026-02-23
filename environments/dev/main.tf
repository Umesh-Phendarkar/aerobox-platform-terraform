provider "aws" {
  region = var.region
}
module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_cidr_blocks  = var.public_cidr_blocks
  private_cidr_blocks = var.private_cidr_blocks
  azs                 = var.azs
}

module "security_groups" {
  source       = "../../modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "iam" {
  source       = "../../modules/iam"
  project_name = var.project_name
}

module "alb" {
  source         = "../../modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg         = module.security_groups.alb_sg
  project_name   = var.project_name
}

module "ec2" {
  source           = "../../modules/ec2_asg"
  ami              = var.ami
  public_subnets   = module.vpc.public_subnets # MUST be public
  app_sg           = module.security_groups.app_sg
  target_group_arn = module.alb.target_group_arn
  project_name     = var.project_name
  public_key_path  = var.public_key_path
}

module "rds" {
  source          = "../../modules/rds"
  private_subnets = module.vpc.private_subnets
  db_sg           = module.security_groups.db_sg
  project_name    = var.project_name
}

module "redis" {
  source          = "../../modules/redis"
  private_subnets = module.vpc.private_subnets
  redis_sg        = module.security_groups.redis_sg
  project_name    = var.project_name
}

module "opensearch" {
  source          = "../../modules/opensearch"
  private_subnets = module.vpc.private_subnets
  os_sg           = module.security_groups.os_sg
  project_name    = var.project_name
}

module "s3" {
  source       = "../../modules/s3"
  project_name = var.project_name
}

module "sqs_ocr" {
  source     = "../../modules/sqs"
  queue_name = "${var.project_name}-ocr"
}
