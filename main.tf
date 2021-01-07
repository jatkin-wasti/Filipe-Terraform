# module myip {
#  source  = "4ops/myip/http"
#  version = "1.0.0"
# }

provider "aws" {

 region = "eu-west-1"
#access_key = "must not write the key here"
#secert_key = "must not write the key here"
}


# Create a VPC
resource "aws_vpc" "vpc-terraform-name" {
  cidr_block       = "12.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "${var.eng_class_person}vpc_terraform"
  }
}

# IGW
resource "aws_internet_gateway" "gw" {
  #reference vpc_id dynamically by:
  # calling the resource,
  # followed by the name of the resource
  # followed by the parameter you want
  vpc_id = aws_vpc.vpc-terraform-name.id

  tags = {
    Name = "${var.eng_class_person}igw_terraform"
  }
}

# call the app module
module "app" {
  source = "./modules/app_tier"
  vpc-terraform-name-id = aws_vpc.vpc-terraform-name.id
  eng_class_person = var.eng_class_person
  gw_id = aws_internet_gateway.gw.id
  nodejs_app = var.nodejs_app
  ssh_key = var.ssh_key
}


# Monitor
# Decide trigger
# ask it to scale out
# replicate ec2 withing public subnet
# Load balancer to distribute traffic to new ec2
# We will use built in tools from AWS
