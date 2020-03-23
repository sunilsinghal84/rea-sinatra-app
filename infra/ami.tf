resource "aws_ami_copy" "enc_ami" {
  name              = "${var.project_name}-enc-ami"
  description       = "source AMI - ${var.ami_id}"
  source_ami_id     = var.ami_id
  source_ami_region = var.aws_region
  encrypted         = true
  kms_key_id        = aws_kms_key.kms_key.arn

  tags = {
    Name     = "${var.project_name}-enc-ami"
    CostCode = var.cost_code
  }
}