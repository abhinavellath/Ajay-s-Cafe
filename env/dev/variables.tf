variable "env" { type = string } # Name of Environment

variable "cidr_block" { type = string } # CIDR Block

variable "nat_count" { type = number } # Count of NAT

variable "alb_name" { type = string } # Name of ALB

variable "ecs_task_count" { type = number } # ECS Task Count

variable "ecs_memory" { type = number } # ECS Memory

variable "ecs_image" { type = string } # ECS Image used

variable "cpu" { type = number} # CPU of ECS task

variable "compatibilities" {type = string} # required compatilibilities in ECS

variable "container_name" {type = string} # Container name in ECS

variable "network_mode" {type = string} # Networking mode

variable "container_port" {type=number} # Container port of ECS task

variable "db_instance_type" { type = string } # DB Instance type

variable "db_storage" { type = number } # Storage used by DB

variable "engine" {type = string } # Engine used by DB

variable "bastion_instance_type" { type = string } # Bastion instance type

variable "bastion_ami" { type = string } # AMI of bastion

variable "key_name" { type = string } # Keyname of bastion

variable "allowed_ips" { type = list(string) } # Allowed ips for bastian

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