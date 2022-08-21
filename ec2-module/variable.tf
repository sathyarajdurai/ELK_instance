variable "ami_id" {
  description = "The ami ID to use in this module"
}

variable "inst_type" {
  description = "The instance type to use in this module"
}

variable "security_id" {
  description = "The security ID to use in this module"
}

variable "subnet_ids" {
  description = "The subnet CIDR value"
}

variable "ec2_name" {
  description  =  "The TAG name of the ec2"
}

variable "key_pair" {
  description  =  "The key pair name"
}

variable "avail_zone" {
  description  =  "The availability zone"
}

variable "instant_profile" {
  description  =  "The instance profile"
}

# variable "is_public" {
#   default = false
#   description = "Subnet is public or private True or False"
# }