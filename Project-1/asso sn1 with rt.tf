# associate subnet with route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sn1.id
  route_table_id = aws_route_table.rt.id
}