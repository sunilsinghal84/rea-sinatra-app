resource "aws_kms_key" "kms_key" {
  description         = "KMS key to encrypt/decrypt"
  enable_key_rotation = true
  tags = {
    Name     = "${var.project_name}-kms-key"
    CostCode = var.cost_code
  }
  policy = templatefile("kms-policy/policy.json", { ACCOUNT_ID = data.aws_caller_identity.current.account_id })
}

resource "aws_kms_alias" "kms-alias" {
  name          = "alias/${var.project_name}-kms-key"
  target_key_id = aws_kms_key.kms_key.key_id
}