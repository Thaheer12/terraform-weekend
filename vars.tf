variable "region" {
  default = "us-east-1"
}
variable "vpc_cidir" {
  default = "192.125.0.0/16"
}
variable "publicsubnet_cidr" {
  type = "list"
  default = ["192.125.1.0/26","192.125.2.0/26"]
}
variable "privatesubnet_cidr" {
  type = "list"
  default = ["192.125.3.0/26","192.125.4.0/26"]
}
variable "default_cidir" {
  default = "0.0.0.0/0"
}
variable "keyname" {
  default = "suresh369"
}
variable "nat_ami" {
  default = "ami-01623d7b"
}
variable "numberofprivate" {
  default = "1"
}

variable "ami" {
  default = "ami-0ff8a91507f77f867"
}
variable "numberofnat" {
  default = "1"
}
data "aws_availability_zones" "available" {}
