provider "aws" {
  region = "ap-south-1"
  access_key = "AKIASDMZEJMP7BT2FPVQ"
  secret_key = "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"
}

# # # Create a VPC
# resource "aws_vpc" "vpc-1" {
# cidr_block = "10.0.0.0/16"
# tags = {
#   "Name" = "vpc-1"
# }
# }


# # Create internet gateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.vpc-1.id

#   tags = {
#     Name = "gw"
#   }
# }

# # create custom route table

# resource "aws_route_table" "rt" {
#   vpc_id = aws_vpc.vpc-1.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   route {
#     ipv6_cidr_block        = "::/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "rt"
#   }
# }
# # create subnet
# resource "aws_subnet" "sn1" {
#   vpc_id = aws_vpc.vpc-1.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "ap-south-1a"

#   tags = {
#     "Name" = "sn1"
#   }
# }

# # associate subnet with route table

# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.sn1.id
#   route_table_id = aws_route_table.rt.id
# }

# # create security group to allow port 22,80,443

# resource "aws_security_group" "sg1" {
#   name        = "allow_webtraffic"
#   description = "Allow Web traffic"
#   vpc_id      = aws_vpc.vpc-1.id

#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "sg1"
#   }
# }

# # create network interface  with ip created in step 4

# resource "aws_network_interface" "webserver" {
#   subnet_id       = aws_subnet.sn1.id
#   private_ips     = ["10.0.1.50"]
#   security_groups = [aws_security_group.sg1.id]

#   # attachment {
#   #   instance     = [aws_instance.mytest.id]
#   #   device_index = 0
#   # }
# }
# # assign elastic ip to the network interface created
# resource "aws_eip" "one" {
#   vpc                       = true
#   network_interface         = aws_network_interface.webserver.id
#   associate_with_private_ip = "10.0.1.50"
#   depends_on                = [aws_internet_gateway.gw]
# }
# create ubuntu server
resource "aws_instance" "mytest" {
  ami = "ami-0d758c1134823146a"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name         = "main_key_emailacc"

network_interface {
  device_index = 0
  network_interface_id = aws_network_interface.webserver.id
}

# user_data = <<EOF
#  #!/bin/bash
#  sudo apt update -y
#  sudo apt install apache2 -y
#  sudo systemctl start apache2.service
#  sudo bash -c 'echo you very first web server > /var/www/html/index.html'
#  EOF






 tags = {
    "Name" = "Terraformserver"
  }



}


##ubuntu
# resource "aws_instance" "mytest" {
#   ami = "ami-0d758c1134823146a"
#   instance_type = "t2.micro"
#   tags = {
#     "Name" = "Terraformserver"
#   }
# }

#Create a VPC
# resource "aws_vpc" "vpc-1" {
# cidr_block = "10.0.0.0/16"
# tags = {
#   "Name" = "vpc-1"
# }
# }

# resource "aws_subnet" "subnet-1" {
#   vpc_id = aws_vpc.vpc-1.id
# cidr_block = "10.0.1.0/24"
# tags = {
#   "Name" = "subnet-1-terraform"
# }
# }


# [id=i-03da677b1221f80b2]
#windows

##route table gateway association
# data "aws_ec2_local_gateway_route_table" "example" {
#   outpost_arn = "arn:aws:outposts:us-west-2:123456789012:outpost/op-1234567890abcdef"
# }

# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_ec2_local_gateway_route_table_vpc_association" "example" {
#   local_gateway_route_table_id = data.aws_ec2_local_gateway_route_table.example.id
#   vpc_id                       = aws_vpc.example.id
# }