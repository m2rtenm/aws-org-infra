variable "permission_set_name" {}
variable "policy_arns" {
  type = list(string)
}

variable "power_user_access" {
  default = "arn:aws:iam::aws:policy/PowerUserAccess"
}

variable "admin_access" {
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "read_only_access" {
  default = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}