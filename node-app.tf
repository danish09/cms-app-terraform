variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "eu-west-2"
}

resource "aws_instance" "built-by-cms-slave" {
  ami           = "ami-0b0a60c0a2bd40612"
  instance_type = "t2.micro"
}
