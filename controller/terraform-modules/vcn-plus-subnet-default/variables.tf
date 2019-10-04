variable "compartment_ocid" {}

variable "vcn_cidr_block" {
  default = ""
}

variable "vcn_dns_label" {
  default = "vcn"
}

variable "vcn_display_name" {
  default = "vcn"
}

variable "igw_display_name" {
  default = "internet-gateway"
}

variable "routetable_display_name" {
  default = "Default Route Table for aviatrix-vcn"
}

variable "subnet_cidr_block" {}

variable "subnet_display_name" {
  default = "subnet"
}

variable "subnet_dns_label" {
  default = "subnet"
}
