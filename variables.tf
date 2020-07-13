variable "mongodbatlas_public_key" {
  default = "ASDFGHJKL"
}

variable "mongodbatlas_private_key" {
  default = "003vv3ddc-9wq4-0000-12DR-43654GV347653"
}

variable "org_id" {
  default = "50Dw8ubpF5Xy5sIxI7B6mqzB"
}

variable "DevAccountID" {
  description = "AWS Developer Account"
  default     = "433557060119"
}


variable "vpn_ip" {
  default = "1.2.3.4/32"
}

variable "sftp_ip" {
  default = "5.6.7.8/32"
}

variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}
