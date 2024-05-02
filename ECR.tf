resource "aws_ecr_repository" "ecr_hub" {
  name = "taskes_app"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}