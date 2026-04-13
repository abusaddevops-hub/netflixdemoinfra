provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "one" {
  count = 4
  ami = "ami-080254318c2d8932f"
  instance_type = "c7i-flex.large"
  key_name = "test-key"
  vpc_security_group_ids = ["sg-07bafe0efe2a4fdbd"]

  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "APPSERVER-1", "APPSERVER-2", "Monitoring server"]
}
