variable "env" {}
variable "vpc_id" {}
variable "public_subnet" {}

variable "instance_type" {}
variable "ami" {}
variable "key_name" {}

variable "allowed_ips" {
  description = "Allowed IPs for SSH"
  type        = list(string)
}