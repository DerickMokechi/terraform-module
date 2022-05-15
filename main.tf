module "networking" {
  source   = "./Modules/Networking"
  vpc_cidr = var.vpc_cidr
}