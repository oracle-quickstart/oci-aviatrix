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
    default = "5.0"
    description = "Aviatrix Controller Version available in the Marketplace"
}