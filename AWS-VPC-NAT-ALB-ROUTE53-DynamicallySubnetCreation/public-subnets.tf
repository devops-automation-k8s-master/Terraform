locals {
  public_subnet_count = "${length(data.aws_availability_zones.total_az.names)}"
}

#Create AWS internet_gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"
}

#Create public-subnets in each AZ of a given region using subnet_size and network_base_cidr.
resource "aws_subnet" "public-subnets" {
  count                   = "${local.public_subnet_count}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  availability_zone       = "${element(data.aws_availability_zones.total_az.names,count.index)}"
  cidr_block              = "${cidrsubnet(var.network_base_cidr,32-element(split("/",var.network_base_cidr),1)-ceil(log(var.subnet_size,2)),count.index)}"
  map_public_ip_on_launch = "true"
}

#Create route table and attach the internet gatway to this route table.
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }
}

#Attach  subnets to public route table.
resource "aws_route_table_association" "public-subnets-association" {
  count          = "${local.public_subnet_count}"
  subnet_id      = "${element(aws_subnet.public-subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.public-rt.id}"
}
