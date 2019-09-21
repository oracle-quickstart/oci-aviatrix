## Subscribe to Marketplace listing
module "subscribe_to_marketplace" {
  source          = "../terraform-modules/marketplace"
  enabled         = "true" //true or false
  compartment_id  = "${var.compartment_ocid}"
  product_version = "${var.product_version}"
  license_model     = "${var.license_model}"               //BYOL or PAID
}
