# research how to create variables in terraform to use in main.tf
# use the variable instead of hard coding in main.tf

variable "region" {
default = "eu-west-1"
}

variable "nodejs_app" {
default = "ami-04337085e29a3125f"
}

#variable "db_ami" {
# default = "ami-0ce081d2daeaa8021"
#}

variable "ssh_key" {
default = "eng74-jamie-aws-key"
}

variable "inst_type" {
default = "t2.micro"
}


variable "eng_class_person" {
  default = "eng74-jamie-fp-"
}
