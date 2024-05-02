data "aws_iam_policy_document" "ass_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "backup_role" {
  name = "backup-role"
  assume_role_policy = data.aws_iam_policy_document.ass_role.json
}

resource "aws_iam_role_policy_attachment" "backup_role_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role= aws_iam_role.backup_role.name
}