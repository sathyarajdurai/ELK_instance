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
#   vpc_id = aws_vpc.lab_vpc.id

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
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.nat_route_tbl.id
# }

# resource "aws_route_table_association" "data" {
#   for_each = aws_subnet.data

#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.nat_route_tbl.id
# }