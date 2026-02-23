resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.project_name}-db"
  engine                  = "postgres"
  engine_version          = "14"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp3"

  username                = "postgres"
  password                = "ChangeMe123!"   # ⚠️ For demo only (use Secrets Manager in prod)

  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.db_sg]

  multi_az                = true
  publicly_accessible     = false

  backup_retention_period = 7
  skip_final_snapshot     = true

  storage_encrypted       = true
  deletion_protection     = false

  tags = {
    Name = "${var.project_name}-rds"
  }
}
