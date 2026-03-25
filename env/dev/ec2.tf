module "bastion" {
  source = "../../modules/ec2"   

  env            = var.env
  vpc_id         = module.vpc.vpc_id
  public_subnet  = module.vpc.public_subnets[0]

  instance_type  = var.bastion_instance_type
  ami            = var.bastion_ami
  key_name       = var.key_name

  allowed_ips    = var.allowed_ips
}