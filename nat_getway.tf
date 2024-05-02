resource "aws_nat_gateway" "ngw1" {
    allocation_id = aws_eip.nat1.id

    subnet_id = aws_subnet.public_1.id

    tags = {
      Name = "NAT1"
    }
}

resource "aws_nat_gateway" "ngw2" {
    allocation_id = aws_eip.nat2.id

    subnet_id = aws_subnet.public_2.id

    tags = {
      Name = "NAT2"
    }
}