resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private1" {
    subnet_id = aws_subnet.private_1.id
    route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "private2" {
    subnet_id = aws_subnet.private_2.id
    route_table_id = aws_route_table.private_route_table_2.id
}