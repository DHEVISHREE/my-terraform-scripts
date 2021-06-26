# assign elastic ip to the network interface created
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.webserver.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.gw]
}