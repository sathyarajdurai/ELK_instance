# resource "aws_instance" "elk_server" {
  
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   # security group
#   vpc_security_group_ids = [aws_security_group.elk_secruity.id]
#   # key-pair
#   key_name = "talent-academy-lab"
#   # subnet
#   subnet_id = data.aws_subnet.public_sub.id
#   # EIP

#   tags = {
#     Name = "test-Server"
#   }
# }


module "kibana" {
  source ="./ec2-module"
  ami_id  = data.aws_ami.kibana_id.id
  inst_type = "t2.micro"
  security_id = aws_security_group.kibana_secruity.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.public_sub.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1a" 
  ec2_name = "kibana-server"
   
}

module "bastion" {
  source ="./ec2-module"
  inst_type = "t2.micro"
  ami_id  = data.aws_ami.ubuntu.id
  security_id = data.aws_security_group.public_sg.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.public_sub.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1a" 
  ec2_name = "bastion-server"

}

resource "aws_eip" "kibana_eip" {
  instance = module.kibana.instance_id
  vpc      = true
}

resource "aws_eip" "bastion_eip" {
  instance = module.bastion.instance_id
  vpc      = true
}

module "elasticsearch" {
  source ="./ec2-module"
  ami_id  = data.aws_ami.elasticsearch_id.id
  inst_type = "t3.medium"
  security_id = aws_security_group.kibana_secruity.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.mon_private_sub.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1a" 
  ec2_name = "elasticsearch-server"
   
}


module "logstash" {
  source ="./ec2-module"
  inst_type = "t3.medium"
  ami_id  = data.aws_ami.logstash_id.id
  security_id = aws_security_group.logstach_secruity.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.mon_private_sub.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1a" 
  ec2_name = "logstach-server"
}

module "demo1a" {
  source ="./ec2-module"
  ami_id  = data.aws_ami.filebeats_id.id
  inst_type = "t2.micro"
  security_id = aws_security_group.demo_secruity.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.app_private_sub1a.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1a" 
  ec2_name = "beats-server1a"
   
}

module "demo1b" {
  source ="./ec2-module"
  inst_type = "t2.micro"
  ami_id  = data.aws_ami.filebeats_id.id
  security_id = aws_security_group.demo_secruity.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.app_private_sub1b.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1b"
  ec2_name = "beats-server1b"
}

module "demo1c" {
  source ="./ec2-module"
  inst_type = "t2.micro"
  ami_id  = data.aws_ami.filebeats_id.id
  security_id = aws_security_group.demo_secruity.id
  key_pair  = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.app_private_sub1c.id
  instant_profile = aws_iam_instance_profile.ssm_profile.id
  avail_zone = "eu-west-1c"
  ec2_name = "beats-server1c"
}
