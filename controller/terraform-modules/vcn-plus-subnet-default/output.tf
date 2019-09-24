output "vcn_id" {
  value = "${join("",oci_core_vcn.vcn.*.id)}"
}

output "default_dhcp_options_id" {
  value = "${join("",oci_core_vcn.vcn.*.default_dhcp_options_id)}"
}

output "default_security_list_id" {
  value = "${join("",oci_core_vcn.vcn.*.default_security_list_id)}"
}

output "subnet_id" {
  value = "${join("", oci_core_subnet.public_subnet.*.id)}"
}
