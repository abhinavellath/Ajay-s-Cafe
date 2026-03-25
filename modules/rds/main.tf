resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-db-subnet"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "this" {
  identifier        = "${var.env}-db"
  engine            = "postgres"
  instance_class    = var.instance_type
  allocated_storage = var.storage

  username = "admin"
  password = "Password123!"   # change in real use

  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot  = true
}