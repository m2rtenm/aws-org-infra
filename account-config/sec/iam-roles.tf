module "admin_role" {
  source = "../../modules/iam-roles"
  account_identifier = "sec"
  role_name = "AdminRole"
  policy_arns = [ admin_access ]

  providers = {
    aws = aws.sec
  }
}

module "readonly_role" {
  source = "../../modules/iam-roles"
  account_identifier = "sec"
  role_name = "ReadOnlyRole"
  policy_arns = [ read_only_access ]
  
  providers = {
    aws = aws.sec
  }
}