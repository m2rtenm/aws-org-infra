module "developer_role" {
  source = "../../modules/iam-roles"
  account_identifier = "prod"
  role_name = "DeveloperRole"
  policy_arns = [ power_user_access ]

  providers = {
    aws = aws.prod
  }
}

module "admin_role" {
  source = "../../modules/iam-roles"
  account_identifier = "prod"
  role_name = "AdminRole"
  policy_arns = [ admin_access ]

  providers = {
    aws = aws.prod
  }
}

module "readonly_role" {
  source = "../../modules/iam-roles"
  account_identifier = "prod"
  role_name = "ReadOnlyRole"
  policy_arns = [ read_only_access ]
  
  providers = {
    aws = aws.prod
  }
}