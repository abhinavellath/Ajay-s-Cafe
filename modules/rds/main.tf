resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-db-subnet"
  subnet_ids = var.private_subnets
}

data "aws_secretsmanager_secret_version" "db_creds" {
  secret_id = var.secret_arn
}

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.db_creds.secret_string)
}

resource "aws_db_instance" "this" {
  identifier        = "${var.env}-db"
  engine            = var.engine
  instance_class    = var.instance_type
  allocated_storage = var.storage

  username = local.db_creds.username
  password = local.db_creds.password

  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot  = true
}