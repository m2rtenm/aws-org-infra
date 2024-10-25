resource "aws_organizations_policy" "deny_non_prod_termination" {
  name        = "DenyNonProdTermination"
  description = "Deny termination of resources in NonProd accounts"
  content = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Action" : [
          "ec2:TerminateInstances",
          "s3:DeleteBucket"
        ],
        "Resource" : "*"
      }
    ]
  })
  type = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_non_prod_scp" {
  policy_id = aws_organizations_policy.deny_non_prod_termination.id
  target_id = aws_organizations_organizational_unit.non_prod.id
}