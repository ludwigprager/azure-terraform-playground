variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "sta_rg_location" {
  type    = string
  default = "West Europe"
}

variable "sta_name" {
  type    = string
}

variable "sta_rg_name" {
  type    = string
  default = "rg-sta-atp-001"
}

variable "keyvault_name" {
  type = string
}

variable "signed_in_user_object_id" {
  type = string
}
