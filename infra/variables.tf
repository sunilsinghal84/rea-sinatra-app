variable "project_name" {
  type        = string
  default     = "rea-sinatra-app"
  description = "project name for namespacing the resources"
}

variable "cost_code" {
  type        = string
  default     = "rea-recruitment"
  description = "Cost code for tagging the resources"
}

variable "instance_type" {
  description = "EC2 instance type for launch template configuration"
  type = string
  default = "t2.micro"
}

variable "ami_id" {
  type        = string
  default     = "ami-08fdde86b93accf1c"
  description = "AWS Machine Image (AMI) ID"
}

variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "aws region"
}

variable "ssh_key_name" {
  type        = string
  default     = "rea-sinatra-app-instance-key"
  description = "Already created ssh key pair name. This is used for SSH access to EC2 instances"
}

variable "asg_min_size" {
  type        = string
  default     = "1"
  description = "Auto scaling group min size"
}

variable "asg_max_size" {
  type        = string
  default     = "1"
  description = "Auto scaling group max size"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-07022160"
  description = "VPC id to deploy the resources"
}
