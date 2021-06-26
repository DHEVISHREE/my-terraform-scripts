# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "gw"
  }
}
