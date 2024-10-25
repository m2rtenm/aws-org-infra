resource "aws_organizations_organization" "org" {
  feature_set = "ALL"

  aws_service_access_principals = [
    "sso.amazonaws.com",
    "access-analyzer.amazonaws.com",
    "account.amazonaws.com"
  ]
  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "non_prod" {
  name      = "Non-prod"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "other" {
  name      = "Other"
  parent_id = aws_organizations_organization.org.roots[0].id
}


resource "aws_organizations_account" "dev" {
  name      = "Development"
  email     = "marten.mandla+aws-dev@outlook.com"
  parent_id = aws_organizations_organizational_unit.non_prod.id
}

resource "aws_organizations_account" "prod" {
  name      = "Production"
  email     = "marten.mandla+aws-prod@outlook.com"
  parent_id = aws_organizations_organizational_unit.prod.id
}

resource "aws_organizations_account" "shared" {
  name      = "Shared services"
  email     = "marten.mandla+aws-shared@outlook.com"
  parent_id = aws_organizations_organizational_unit.other.id
}

resource "aws_organizations_account" "sec" {
  name      = "Security and logging"
  email     = "marten.mandla+aws-sec@outlook.com"
  parent_id = aws_organizations_organizational_unit.other.id
}