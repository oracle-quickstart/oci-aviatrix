
## Creates a VCN with a public subnet and default IGW and Route Table
module "default_vcn_plus_subnet" {
  source              = "./terraform-modules/vcn-plus-subnet-default"
  compartment_ocid    = var.compartment_ocid
  vcn_display_name    = var.vcn_display_name
  vcn_cidr_block      = var.vcn_cidr_block
  vcn_dns_label       = var.vcn_dns_label
  subnet_display_name = var.subnet_display_name
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_dns_label    = var.subnet_dns_label

  use_existing_network = var.network_strategy == "Create New VCN and Subnet" ? false : true
  vcn_id               = var.network_strategy == "Create New VCN and Subnet" ? "" : var.vcn_id
  subnet_id            = var.network_strategy == "Create New VCN and Subnet" ? "" : var.subnet_id
}

## Allow Ingress HTTPS from 
module "default_network_sec_group" {
  source           = "./terraform-modules/network-security-groups"
  compartment_ocid = var.compartment_ocid
  nsg_display_name = var.nsg_display_name
  nsg_whitelist_ip = var.nsg_whitelist_ip
  vcn_id           = module.default_vcn_plus_subnet.vcn_id
  vcn_cidr_block   = module.default_vcn_plus_subnet.vcn_cidr_block
}

## Subscribe to Marketplace listing
module "subscribe_to_marketplace" {
  source                      = "./terraform-modules/marketplace/subscription"
  compartment_id              = var.compartment_ocid
  mp_listing_id               = var.mp_listing_id
  mp_listing_resource_version = var.mp_listing_resource_version
  mp_listing_resource_id      = var.mp_listing_resource_id

}


resource "oci_core_instance" "vm" {
  depends_on          = [module.subscribe_to_marketplace]
  availability_domain = var.availability_domain
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
    source_id   = var.mp_listing_resource_id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

output "aviatrix_controller_public_ip" {
  value = oci_core_instance.vm.public_ip
}

output "aviatrix_controller_private_ip" {
  value = oci_core_instance.vm.private_ip
}

output "aviatrix_controller_url" {
  value = "https://${oci_core_instance.vm.public_ip}"
}

