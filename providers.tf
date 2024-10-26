provider "aws" {
  alias = "dev"
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.dev.id}:role/dev-OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias = "prod"
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.prod.id}:role/prod-OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias = "shared"
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.shared.id}:role/shared-OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias = "sec"
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.sec.id}:role/sec-OrganizationAccountAccessRole"
  }
}