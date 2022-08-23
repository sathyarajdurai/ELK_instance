resource "aws_security_group" "kibana_secruity" {
  name        = "kibana-elk-security"
  description = "Allow dashboard traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [data.aws_security_group.public_sg.id] 
  }
  ingress {
    description      = "Allow port 5601"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    #cidr_blocks      = [module.bastion.private_ip]
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  ingress {
    description      = "Allow port 9200"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "kibana-elk-security"
  }
}

resource "aws_security_group" "elastic_secruity" {
  name        = "elastic-elk-security"
  description = "Allow  inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [data.aws_security_group.public_sg.id]
  }

  ingress {
    description      = "Allow port 9200"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "elatic-elk-security"
  }
}



resource "aws_security_group" "logstach_secruity" {
  name        = "logstach-elk-security"
  description = "Allow elastic inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [data.aws_security_group.public_sg.id]
    
  }

  ingress {
    description      = "Allow port 5000"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "logstach-elk-security"
  }
}

resource "aws_security_group" "demo_secruity" {
  name        = "demo-elk-security"
  description = "Allow logstach inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [data.aws_security_group.public_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo-elk-security"
  }
}