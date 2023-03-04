output "iam_user_arn" {
  description = "arn of the uer"
  value = aws_iam_user.user.arn
}

output "access_id" {
  value = aws_iam_access_key.secret.id
}

output "secret_key" {
  value = aws_iam_access_key.secret.secret
}