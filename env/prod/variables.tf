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

variable "cpu" { 
  type = number
}

variable "compatibilities" {
  type = string
}

variable "container_name" {
  type = string
}

variable "network_mode" {
  type = string
}

variable "container_port" {
  type= number
}

variable "db_instance_type" {
  type = string
}

variable "db_storage" {
  type = number
}

variable "engine" {
  type = string
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

variable "secrets_name" { type = string} # Secrets name

variable "secret_data" {             
  description = "Key-value map for secret"
  type        = map(string)
  sensitive   = true
}  # Secrets Data

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}