module "prod_developer_role" {
  source             = "./modules/iam-roles"
  account_identifier = "prod"
  role_name          = "DeveloperRole"
  policy_arns        = ["arn:aws:iam::aws:policy/PowerUserAccess"]

  providers = {
    aws = aws.prod
  }
}

module "prod_admin_role" {
  source             = "./modules/iam-roles"
  account_identifier = "prod"
  role_name          = "AdminRole"
  policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]

  providers = {
    aws = aws.prod
  }
}

module "prod_read_only_role" {
  source             = "./modules/iam-roles"
  account_identifier = "prod"
  role_name          = "ReadOnlyRole"
  policy_arns        = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

  providers = {
    aws = aws.prod
  }
}