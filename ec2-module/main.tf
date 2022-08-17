resource "aws_instance" "elk_server" {
  
  ami           = var.ami_id
  instance_type = var.inst_type

  # security group
  vpc_security_group_ids = [var.security_id]
  # key-pair
  key_name = var.key_pair
  # subnet
  subnet_id = var.subnet_ids
  availability_zone = var.avail_zone

  tags = {
    Name = var.ec2_name
  }
}