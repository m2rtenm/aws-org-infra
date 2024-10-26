module "shared_developer_role" {
  source             = "./modules/iam-roles"
  account_identifier = "shared"
  role_name          = "DeveloperRole"
  policy_arns        = ["arn:aws:iam::aws:policy/PowerUserAccess"]

  providers = {
    aws = aws.shared
  }
}

module "shared_admin_role" {
  source             = "./modules/iam-roles"
  account_identifier = "shared"
  role_name          = "AdminRole"
  policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]

  providers = {
    aws = aws.shared
  }
}

module "shared_read_only_role" {
  source             = "./modules/iam-roles"
  account_identifier = "shared"
  role_name          = "ReadOnlyRole"
  policy_arns        = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

  providers = {
    aws = aws.shared
  }
}