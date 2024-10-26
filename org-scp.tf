data "aws_iam_policy_document" "deny_non_prod_termination" {
  statement {
    effect = "Deny"
    actions = [
      "ec2:TerminateInstances",
      "s3:DeleteBucket"
    ]
    resources = ["*"]
  }
}

resource "aws_organizations_policy" "deny_non_prod_termination" {
  name        = "DenyNonProdTermination"
  description = "Deny termination of resources in NonProd accounts"
  content     = data.aws_iam_policy_document.deny_non_prod_termination.json
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_non_prod_scp" {
  policy_id = aws_organizations_policy.deny_non_prod_termination.id
  target_id = aws_organizations_organizational_unit.non_prod.id
}