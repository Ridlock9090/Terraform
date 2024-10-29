resource "aws_instance" "myec2" {
  ami           = ami-050cd642fd83388e4
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-instance"
  }
}

resource "aws_vpc" "name" {
  
}