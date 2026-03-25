variable "env" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "nat_count" {
  type = number
}

variable "alb_name" {
  type = string
}

variable "ecs_task_count" {
  type = number
}

variable "ecs_memory" {
  type = number
}

variable "ecs_image" {
  type = string
}

variable "db_instance_type" {
  type = string
}

variable "db_storage" {
  type = number
}

variable "bastion_instance_type" {
  type = string
}

variable "bastion_ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "allowed_ips" {
  type = list(string)
}