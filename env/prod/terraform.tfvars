env = "prod"

cidr_block = "10.1.0.0/16"

nat_count = 2

alb_name = "prod-alb"

ecs_task_count = 5
ecs_memory     = 2048
ecs_image      = "nginx"

db_instance_type = "db.m7i.large"
db_storage       = 100

bastion_instance_type = "t3.micro"
bastion_ami           = "ami-0f58b397bc5c1f2e8"

key_name = "your-keypair"

allowed_ips = ["YOUR_IP/32"]