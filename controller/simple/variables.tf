# Variables required by the OCI Provider
variable "tenancy_ocid" {}

variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "private_key_path" {}
variable "ssh_public_key" {}

# Variables required for launching Aviatrix Controller
variable "compartment_ocid" {
  description = "Compartment where infrastructure resources will be created"
}

variable "license_model" {
  description = "Enter Marketplace License model = BYOL or PAID"
}

variable "product_version" {
  default     = "5.0.1"
  description = "Aviatrix Controller Version available in the Marketplace"
}

# Standard OCI Variables for Compute and Networking Resources
variable "availability_domain" {
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "vm_display_name" {
  default = "controller"
}

variable "vm_compute_shape" {
  default = "VM.Standard2.2" //2 cores
}

variable "vcn_display_name" {
  default = "aviatrix-vcn"
}

variable "vcn_dns_label" {
  default = "aviatrix"
}

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_display_name" {
  default = "controller-subnet"
}

variable "subnet_cidr_block" {
  default = "10.0.0.0/24"
}

variable "subnet_dns_label" {
  default = "management"
}

variable "nsg_display_name" {
  default = "controller-sec-group"
}

variable "nsg_whitelist_ip" {
  description = "Network Security Groups - Whitelisted CIDR block for ingress communication: Enter 0.0.0.0/0 or <your IP>/32 "
  default     = "0.0.0.0/0"
}
