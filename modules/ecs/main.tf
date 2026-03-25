resource "aws_ecs_cluster" "this" {
  name = "${var.env}-cluster"
}

resource "aws_ecs_task_definition" "task" {
  family                   = "${var.env}-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = var.memory

  network_mode = "awsvpc"

  container_definitions = jsonencode([
    {
      name  = "app"
      image = var.image
      cpu   = 256
      memory = var.memory
      essential = true
      portMappings = [{
        containerPort = 80
      }]
    }
  ])
}

resource "aws_ecs_service" "service" {
  name            = "${var.env}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = var.task_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.private_subnets
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.tg_arn
    container_name   = "app"
    container_port   = 80
  }
}