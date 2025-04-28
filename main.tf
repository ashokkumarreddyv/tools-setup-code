terraform {
  backend "s3" {
    bucket = "ashoks-03"
    key    = "tools/state"
    region = "us-east-1"

  }
}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "tools" {
  default = {

    valut = {
      instance_type = "t3.small"
      port          = 8200
    }
  }
}


module "tools-infra" {
  source = "./module-infra"
  for_each = var.tools
  ami_id = var.ami_id
  instance_type = each.value["instance_type"]
  name    = each.key
  port    = each.value ["port"]
}
