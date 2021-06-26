
# create network interface  with ip created in step 4

resource "aws_network_interface" "webserver" {
  subnet_id       = aws_subnet.sn1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.sg1.id]

  # attachment {
  #   instance     = [aws_instance.mytest.id]
  #   device_index = 0
  # }

  tags = {
    "Name" = "n/w int"
  }
}