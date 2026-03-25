module "networking" {
  source         = "../../modules/networking"
  nat_count      = var.nat_count
  public_subnets = module.vpc.public_subnets
}