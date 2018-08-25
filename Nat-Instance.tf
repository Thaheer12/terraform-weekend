resource "aws_instance" "nat" {
  count = "${var.numberofnat}"
  ami           = "${var.nat_ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.publicsubnets.*.id[count.index]}"
  associate_public_ip_address = true
  source_dest_check = false
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  key_name = "${var.keyname}"
  tags {
    Name = "NatInstance-${count.index + 1}"
  }
}
