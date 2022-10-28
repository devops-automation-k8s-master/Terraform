#Create AWS EIP for NatGateWay
resource "aws_eip" "nat-eip" {
  vpc = "true"
}

#Create AWS NatGateWay in a public subnet and associate nat-eip to this natgatway.
resource "aws_nat_gateway" "ng" {
  allocation_id = "${aws_eip.nat-eip.id}"
  subnet_id     = "${aws_subnet.public-subnets.*.id[0]}"
  depends_on    = ["aws_internet_gateway.ig"]
}
