variable "scw_org" {}

variable "scw_token" {}

variable "private_key" {
  type = "string"
  default = "~/.ssh/id_rsa"
  description = "The path to your private key"
}

variable "region" {
  default = "par1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  default = "START1-S"
}

variable "nodes" {
  default = 3
}

variable "cloudflare_email" {}

variable "cloudflare_token" {}

variable "cloudflare_zone" {}

variable "cluster_secret" {}
