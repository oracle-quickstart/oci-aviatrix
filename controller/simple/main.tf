## Subscribe to Marketplace listing
module "subscribe_to_marketplace" {
  // source = "github.com/oracle/oci-quickstart-aviatrix/controller/terraform-modules/marketplace"  
  source          = "../terraform-modules/marketplace"
  enabled         = "true" //true or false
  compartment_id  = var.compartment_ocid
  product_version = var.product_version
  license_model   = var.license_model //BYOL or PAID
}

## Creates a VCN with a public subnet and default IGW and Route Table
module "default_vcn_plus_subnet" {
  // source = "github.com/oracle/oci-quickstart-aviatrix/controller/terraform-modules/vcn-plus-subnet-default"
  source              = "../terraform-modules/vcn-plus-subnet-default"
  compartment_ocid    = var.compartment_ocid
  vcn_display_name    = var.vcn_display_name
  vcn_cidr_block      = var.vcn_cidr_block
  vcn_dns_label       = var.vcn_dns_label
  subnet_display_name = var.subnet_display_name
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_dns_label    = var.subnet_dns_label
}

## Allow Ingress HTTPS from 
module "default_network_sec_group" {
  // source           = "github.com/oracle/oci-quickstart-aviatrix/controller/terraform-modules/network-security-groups"
  source           = "../terraform-modules/network-security-groups"
  compartment_ocid = var.compartment_ocid
  nsg_display_name = var.nsg_display_name
  nsg_whitelist_ip = var.nsg_whitelist_ip
  vcn_id           = module.default_vcn_plus_subnet.vcn_id
  vcn_cidr_block   = var.vcn_cidr_block
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.availability_domain
}

resource "oci_core_instance" "simple-vm" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = var.vm_display_name
  shape               = var.vm_compute_shape

  create_vnic_details {
    subnet_id        = module.default_vcn_plus_subnet.subnet_id
    display_name     = var.vm_display_name
    assign_public_ip = true
    nsg_ids          = [module.default_network_sec_group.nsg_id]
  }

  source_details {
    source_type = "image"
    source_id   = module.subscribe_to_marketplace.marketplace_resource_id
  }
}

output "aviatrix_controller_public_ip" {
  value = oci_core_instance.simple-vm.public_ip
}

output "aviatrix_controller_private_ip" {
  value = oci_core_instance.simple-vm.private_ip
}

output "aviatrix_controller_url" {
  value = "https://${oci_core_instance.simple-vm.public_ip}"
}

