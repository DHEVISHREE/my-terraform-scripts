# create subnet
resource "aws_subnet" "sn1" {
  vpc_id = aws_vpc.vpc-1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    "Name" = "sn1"
  }
}
