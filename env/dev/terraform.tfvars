env = "dev"

cidr_block = "10.0.0.0/16"

nat_count = 1

alb_name = "dev-alb"

ecs_task_count = 1
ecs_memory     = 2048
ecs_image      = "nginx"
cpu = 256
compatibilities = "FARGATE"
container_name = "app"
network_mode = "awsvpc"
container_port = 80

db_instance_type = "db.t2.small"
db_storage       = 50
engine           = "postgres"

bastion_instance_type = "t2.micro"
bastion_ami           = "ami-0f58b397bc5c1f2e8"

key_name = "your-keypair"

allowed_ips = ["YOUR_IP/32"]

secret_data = {
  db_username = "admin"
  db_password = "DevPassword123!"
}