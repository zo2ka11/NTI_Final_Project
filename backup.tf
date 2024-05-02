resource "aws_backup_plan" "jenkins_backup_plan" {
  name = "jenkins_backup_plan"

  rule {
    rule_name = "snapshot"
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule = "cron(0 0 * * ? *)"

    lifecycle {
      delete_after = 7
    }
  }
}



resource "aws_backup_selection" "backup_selection" {
  iam_role_arn = aws_iam_role.backup_role.arn
  name = "daily_backup_selection"
  plan_id = aws_backup_plan.jenkins_backup_plan.id

  resources = [
    aws_instance.jenkins_server.arn
  ]
}