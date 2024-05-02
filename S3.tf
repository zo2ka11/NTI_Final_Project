resource "aws_s3_bucket" "s3_logs" {
  bucket = "Final_Project_NTI"
  tags = {
    Name = "My bucket"
    Environment = "Dev"
  }
}