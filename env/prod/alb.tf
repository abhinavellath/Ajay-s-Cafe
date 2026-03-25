module "alb" {
  source         = "../../modules/alb"
  name           = var.alb_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}