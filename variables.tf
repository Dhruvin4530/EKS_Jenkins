# Stack Name
variable "cluster_name" {
  type = string
}

# Worker Node instance size
variable "instance_size" {
  type = string
}

# Region
variable "region" {}

# SSH Access
variable "ssh_access" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

# UI Access
variable "http_access" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

# Environment
variable "env" {
  type    = string
  default = "Prod"
}

# Type
variable "type" {
  type    = string
  default = "Production"
}

# Key 
variable "key_name" {
  default = "Demo-key"
}

# Instance count
variable "instance_count" {
  type = string
}