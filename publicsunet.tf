resource "aws_subnet" "publicsubnets" {
  count = "${length(var.publicsubnet_cidr)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${element(var.publicsubnet_cidr,count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "WiproPublicSubnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags {
    Name = "WiproIgw"
  }
}
# Proiding AWS Roure Table
resource "aws_route_table" "customrt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "${var.default_cidir}"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name = "WiproPublicRT"
  }
}
resource "aws_route_table_association" "association" {
  count = "${length(var.publicsubnet_cidr)}"
  subnet_id      = "${aws_subnet.publicsubnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.customrt.id}"
}
