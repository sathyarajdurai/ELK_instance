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

data "aws_subnet" "mon_private_sub" {  
  filter {
    name   = "tag:Name"
    values = ["monitor_subnet"]
  }
}

data "aws_subnet" "app_private_sub1a" {  
  filter {
    name   = "tag:Name"
    values = ["App-subnet1a"]
  }
}

data "aws_subnet" "app_private_sub1b" {  
  filter {
    name   = "tag:Name"
    values = ["App-subnet1b"]
  }
}
data "aws_subnet" "app_private_sub1c" {  
  filter {
    name   = "tag:Name"
    values = ["App-subnet1c"]
  }
}

data "aws_internet_gateway" "igw_1" {
    filter {
      name   = "tag:Name"
      values = ["internet gateway"]
    }
}

data "aws_ami" "kibana_id" {

  filter {
    name   = "name"
    values = ["kibana"]
  }

  owners = ["151926427169"] # Canonical
}

data "aws_ami" "logstach_id" {

  filter {
    name   = "name"
    values = ["logstach"]
  }

  owners = ["151926427169"] # Canonical
}

data "aws_ami" "elasticsearch_id" {

  filter {
    name   = "name"
    values = ["elasticsearch"]
  }

  owners = ["151926427169"] # Canonical
}

data "aws_key_pair" "eu_key" {
  key_name = "talent-academy-lab"
  # key_pair_id = "key-08d8843f51fea4712"
  include_public_key = true
}

data "aws_security_group" "public_sg" {
  filter {
    name   = "tag:Name"
    values = ["public-elk-security"]
  }
}