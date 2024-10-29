

resource "aws_vpc" "TerraformVPC" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet1a" {
  vpc_id            = aws_vpc.public_subnet1a.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "us-west-2a"
  }

resource "aws_network_interface" "" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
# comment
