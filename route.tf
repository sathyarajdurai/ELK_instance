resource "aws_route_table" "igw_route_tbl" {
  vpc_id = data.aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw_1.id
  }

  tags = {
    Name = "igw-route-table"
  }
}

# resource "aws_route_table" "nat_route_tbl" {
#   vpc_id = aws_vpc.elk_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_gateway.id
#   }

#   tags = {
#     Name = "nat-route-table"
#   }
# }

resource "aws_route_table_association" "public" {
  subnet_id      = data.aws_subnet.public_sub.id
  route_table_id = aws_route_table.igw_route_tbl.id
}

# resource "aws_route_table_association" "private" {
#   subnet_id      = data.aws_subnet.mon_private_sub.id
#   route_table_id = aws_route_table.nat_route_tbl.id
# }

# resource "aws_route_table_association" "app_private" {
#   #for_each = aws_subnet.App_subnet

#   subnet_id      = data.aws_subnet.app_private_sub.id
#   route_table_id = aws_route_table.nat_route_tbl.id
# }