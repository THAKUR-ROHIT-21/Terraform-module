module "vpc" {
  source = "./modules/vpc"

  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

module "vm" {
  source = "./modules/vm"

  vm_name      = var.vm_name
  machine_type = var.machine_type
  zone         = "${var.region}-a"

  network    = module.vpc.network_name
  subnetwork = module.vpc.subnet_name
}

module "bucket" {
  source = "./modules/bucket"

  bucket_name = var.bucket_name
  region      = var.region
}
