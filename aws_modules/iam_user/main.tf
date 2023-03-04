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

resource "aws_iam_group" "admin" {
  name = "administrator"
}

resource "aws_iam_group" "developer" {
  name = "developer"
}

#resource "aws_iam_group_policy" "policy" {
#  group  = aws_iam_group.admin.id
#  policy = "arn:aws:iam::aws:policy/AdministratorAccess"
#}

resource "aws_iam_group_policy_attachment" "pp" {
  group      = aws_iam_group.admin.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "user" {
  name = var.user_name
  path = var.path
  tags = merge(module.label.tags)
}

resource "aws_iam_group_membership" "admin" {
  group = aws_iam_group.admin.name
  name  = "admin-users"
  users = [aws_iam_user.user.name]
}

resource "aws_iam_group_membership" "developer" {
  group = aws_iam_group.developer.name
  name  = "admin-users"
  users = [aws_iam_user.user.name]
}

resource "aws_iam_access_key" "secret" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_ssh_key" "user" {
  username   = aws_iam_user.user.name
  encoding   = var.encoding
  public_key = var.public_key
}

resource "aws_key_pair" "access_key" {
  key_name   = var.name
  public_key = file(var.public_key)
}
