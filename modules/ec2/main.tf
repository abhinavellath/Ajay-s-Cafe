resource "aws_security_group" "bastion_sg" {
  name   = "${var.env}-bastion-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.env}-bastion"
  }
}