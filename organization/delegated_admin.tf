resource "aws_organizations_delegated_administrator" "security_sso" {
  account_id        = aws_organizations_account.sec.id
  service_principal = "sso.amazonaws.com"
}