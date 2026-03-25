module "ecs" {
  source          = "../../modules/ecs"
  env             = var.env
  task_count      = var.ecs_task_count
  memory          = var.ecs_memory
  image           = var.ecs_image
  private_subnets = module.vpc.private_subnets
  tg_arn          = module.alb.target_group_arn
  cpu             = var.cpu
  compatibilities = var.compatibilities
  container_name  = var.container_name
  network_mode    = var.network_mode
  container_port  = var.container_port
}