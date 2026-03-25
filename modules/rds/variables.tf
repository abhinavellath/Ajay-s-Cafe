variable "env" {}
variable "instance_type" {}
variable "storage" {}
variable "private_subnets" {}
variable "engine" {}
variable "secret_arn" {
  description = "ARN of the secret storing DB credentials"
  type        = string
}