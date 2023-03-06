## Create multiple VPC in different region and VPC peering

# Define the second VPC in the us-east-1 region
module "vpc1" {
  source = "./modules/vpc"
  cidr_block = "${var.cidr_block}"
  public_subnets_cidr = "${var.public_subnets_cidr}"
  availability_zones = "${var.availability_zones}"
  private_subnets_cidr = "${var.private_subnets_cidr}"

  providers = {
    aws = aws.us-east-1
  }
}

# Define the second VPC in the us-east-2 region
module "vpc2" {
  source = "./modules/vpc"
  cidr_block = "${var.cidr_block}"
  public_subnets_cidr = "${var.public_subnets_cidr}"
  availability_zones = "${var.availability_zones}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  
  providers = {
    aws = aws.us-east-2
  }
}

# Create the VPC peering connection
resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id = module.vpc1.vpc_id
  vpc_id      = module.vpc2.vpc_id

  auto_accept = true
}