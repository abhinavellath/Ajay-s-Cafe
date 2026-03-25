resource "aws_eip" "nat" {
  count = var.nat_count
}

resource "aws_nat_gateway" "nat" {
  count = var.nat_count

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnets[count.index]
}