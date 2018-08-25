resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidir}"
  tags {
    Name = "WiproVPC"
    Environment = "Dev"
    Company = "Wipro"
  }
}
