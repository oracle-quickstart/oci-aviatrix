# VCN comes with default route table, security list and DHCP options

resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr_block
  dns_label      = var.vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  display_name   = var.igw_display_name
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  // display_name               = "defaultRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}


// resource "oci_core_route_table" "rt" {
//   compartment_id = var.compartment_ocid
//   vcn_id         = oci_core_vcn.vcn.id
//   display_name   = var.routetable_display_name

//   route_rules {
//     destination       = "0.0.0.0/0"
//     destination_type  = "CIDR_BLOCK"
//     network_entity_id = oci_core_internet_gateway.igw.id
//   }
// }

resource "oci_core_subnet" "public_subnet" {
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.vcn.id
  cidr_block                 = var.subnet_cidr_block
  display_name               = var.subnet_display_name
  route_table_id             = oci_core_vcn.vcn.default_route_table_id
  dns_label                  = var.subnet_dns_label
  prohibit_public_ip_on_vnic = "false"
}

