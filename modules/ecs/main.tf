resource "aws_ecs_cluster" "this" {
  name = "${var.env}-cluster"
}

resource "aws_ecs_task_definition" "task" {
  family                   = "${var.env}-task"
  requires_compatibilities = [var.compatibilities]
  cpu                      = var.cpu
  memory                   = var.memory

  network_mode = var.network_mode

  container_definitions = jsonencode([
    {
      name  = var.container_name
      image = var.image
      cpu   = var.cpu
      memory = var.memory
      essential = true
      portMappings = [{
        containerPort = var.container_port
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
    container_name   = var.container_name
    container_port   = var.container_port
  }
}