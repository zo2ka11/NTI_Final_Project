resource "aws_instance" "jenkins_server" {
  ami = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id
  key_name = aws_key_pair.jenkins_key.id

  tags = {
    Name = "EC2_jenkins"
  }
}