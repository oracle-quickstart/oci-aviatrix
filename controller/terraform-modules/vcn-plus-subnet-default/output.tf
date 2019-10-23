
output "vcn_id" {
  value = !var.use_existing_network ? join("", oci_core_vcn.vcn.*.id) : var.vcn_id
}

// output "default_dhcp_options_id" {
//   value = join("", oci_core_vcn.vcn.*.default_dhcp_options_id)
// }

// output "default_security_list_id" {
//   value = join("", oci_core_vcn.vcn.*.default_security_list_id)
// }

output "subnet_id" {
  value = !var.use_existing_network ? join("", oci_core_subnet.public_subnet.*.id) : var.subnet_id
}

output "vcn_cidr_block" {
  value = !var.use_existing_network ? join("", oci_core_vcn.vcn.*.cidr_block) : var.vcn_cidr_block
}


