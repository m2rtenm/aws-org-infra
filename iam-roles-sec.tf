module "sec_admin_role" {
  source             = "./modules/iam-roles"
  account_identifier = "sec"
  role_name          = "AdminRole"
  policy_arns        = ["arn:aws:iam::aws:policy/AdministratorAccess"]

  providers = {
    aws = aws.sec
  }
}

module "sec_read_only_role" {
  source             = "./modules/iam-roles"
  account_identifier = "sec"
  role_name          = "ReadOnlyRole"
  policy_arns        = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]

  providers = {
    aws = aws.sec
  }
}