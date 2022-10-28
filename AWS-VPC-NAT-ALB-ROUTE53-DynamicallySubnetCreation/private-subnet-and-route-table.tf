locals {
  private_subnet_count = "${length(data.aws_availability_zones.total_az.names)}"
}

#Create private subnets in each AZ of a given region using  subnet_size and network_base_cidr.
resource "aws_subnet" "private-subnets" {
  count                   = "${local.private_subnet_count}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  availability_zone       = "${element(data.aws_availability_zones.total_az.names,count.index)}"
  cidr_block              = "${cidrsubnet(var.network_base_cidr,32-element(split("/",var.network_base_cidr),1)-ceil(log(var.subnet_size,2)),local.private_subnet_count+count.index)}"
  map_public_ip_on_launch = "false"
}

#Create AWS_route table for privte subnets and creating a route to  natgateway.
resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.ng.id}"
  }
}

#Attach  subnets to private route table.
resource "aws_route_table_association" "private-subnets-association" {
  count          = "${local.private_subnet_count}"
  subnet_id      = "${element(aws_subnet.private-subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.private-rt.id}"
}
