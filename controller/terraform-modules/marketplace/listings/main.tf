locals {
  enabled                  = var.enabled
  listing_id               = var.license_model == "BYOL" ? var.mp_listings["BYOL"] : var.mp_listings["PAID"]
  listing_resource_version = var.license_model == "BYOL" ? var.mp_byol_versions[var.product_version] : var.mp_paid_versions[var.product_version]
  listing_resource_id      = var.license_model == "BYOL" ? var.mp_byol_listing_resource_id[var.mp_byol_versions[var.product_version]] : var.mp_paid_listing_resource_id[var.mp_paid_versions[var.product_version]]
}