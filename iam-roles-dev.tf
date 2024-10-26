module "dev_developer_role" {
  source             = "./modules/iam-roles"
  account_identifier = "dev"
  role_name          = "DeveloperRole"
  policy_arns        = ["arn:aws:iam::aws:policy/PowerUserAccess"]

  providers = {
    aws = aws.dev
  }
}

module "dev_admin_role" {
  source             = "./modules/iam-roles"
  account_identifier = "dev"
  role_name          = "AdminRole"
  policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]

  providers = {
    aws = aws.dev
  }
}

module "dev_read_only_role" {
  source             = "./modules/iam-roles"
  account_identifier = "dev"
  role_name          = "ReadOnlyRole"
  policy_arns        = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

  providers = {
    aws = aws.dev
  }
}