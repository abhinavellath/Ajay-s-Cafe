env = "prod"

cidr_block = "10.1.0.0/16"

nat_count = 2

alb_name = "prod-alb"

ecs_task_count = 5
ecs_memory     = 2048
ecs_image      = "nginx"
cpu = 256
compatibilities = "FARGATE"
container_name = "app"
network_mode = "awsvpc"
container_port = 80

db_instance_type = "db.m7i.large"
db_storage       = 100
engine = "postgres"

bastion_instance_type = "t3.micro"
bastion_ami           = "ami-0f58b397bc5c1f2e8"

key_name = "your-keypair"

allowed_ips = ["YOUR_IP/32"]

secret_data = {
  db_username = "admin"
  db_password = "ProdPassword123!"
}