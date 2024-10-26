data "aws_ssoadmin_instances" "main" {}

resource "aws_ssoadmin_permission_set" "sso_permission_set" {
  name = var.permission_set_name
  description = "Permission set for ${var.permission_set_name}"
  instance_arn = data.aws_ssoadmin_instances.main.arn
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    effect = "Allow"
    actions = [ 
        "ec2:*",
        "s3:*"
     ]
     resources = [ "*" ]
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "inline_policy" {
  permission_set_arn = aws_ssoadmin_permission_set.sso_permission_set.arn
  instance_arn = data.aws_ssoadmin_instances.main.arn
  inline_policy = data.aws_iam_policy_document.inline_policy.json
}

resource "aws_ssoadmin_managed_policy_attachment" "managed_policy" {
  for_each = toset(var.policy_arns)
  instance_arn = data.aws_ssoadmin_instances.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.sso_permission_set.arn
  managed_policy_arn = each.value
}