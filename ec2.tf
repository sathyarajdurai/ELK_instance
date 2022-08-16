resource "aws_instance" "elk_server" {
  
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  # security group
  vpc_security_group_ids = [aws_security_group.elk_secruity.id]
  # key-pair
  key_name = "talent-academy-lab"
  # subnet
  subnet_id = data.aws_subnet.public_sub.id
  # EIP

  tags = {
    Name = "test-Server"
  }
}

resource "aws_eip" "elk_server_ip" {
  instance = aws_instance.elk_server.id
  vpc      = true
}