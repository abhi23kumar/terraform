terraform {
  required_version = "~> 1.3.9"
}

module "label" {
  source     = "../labels"
  namespace  = var.namespace
  name       = var.name
  env        = var.env
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_iam_user" "smtp_user" {
  name = "smtp_user"
  tags = module.label.tags
}

resource "aws_iam_access_key" "smtp_user" {
  user = aws_iam_user.smtp_user.name
  #  tags = module.label.tags
}

data "aws_iam_policy_document" "ses_sender" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ses_sender" {
  name        = "ses_sender"
  description = "Allows sending of e-mails via Simple Email Service"
  policy      = data.aws_iam_policy_document.ses_sender.json
  tags        = module.label.tags
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.smtp_user.name
  policy_arn = aws_iam_policy.ses_sender.arn
}

resource "aws_ses_domain_identity" "ses" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.ses.domain
}

resource "aws_ses_domain_mail_from" "email_domain" {
  domain           = aws_ses_domain_identity.ses.domain
  mail_from_domain = format("%s.%s", var.email_service_username, var.domain)
}

resource "aws_route53_zone" "zone" {
  name = var.domain
  tags = module.label.tags
}

resource "aws_route53_record" "dkim_record" {
  count   = 3
  zone_id = aws_route53_zone.zone.zone_id
  name    = "${element(aws_ses_domain_dkim.dkim.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.dkim.dkim_tokens, count.index)}.dkim.amazonses.com"]
}
