resource "tls_private_key" "rsa_algorithm" {
    rsa_bits  = 4096
    algorithm = "RSA"
}

resource "aws_key_pair" "jenkins_key" {
  key_name  = "ec2_jenkins_key"
  public_key = tls_private_key.rsa_algorithm.public_key_openssh
}

resource "local_file" "private_key_file" {
  content = tls_private_key.rsa_algorithm.private_key_pem
  filename = "${path.module}/ec2_jenkins_key_private.pem"
  file_permission = "0400"
}