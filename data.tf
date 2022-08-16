data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "elk_vpc" {  
  filter {
    name   = "tag:Name"
    values = ["ELK-VPC"]
  }
}

data "aws_subnet" "public_sub" {  
  filter {
    name   = "tag:Name"
    values = ["public_subnet"]
  }
}

data "aws_internet_gateway" "igw_1" {
    filter {
      name   = "tag:Name"
      values = ["internet gateway"]
    }
}