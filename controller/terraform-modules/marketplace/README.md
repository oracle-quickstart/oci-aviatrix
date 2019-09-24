# Marketplace Terraform modules for Aviatrix Controller

These are the Terraform module for subscribing to Aviatrix Controller listings in the Oracle Cloud Infrastructure Marketplace.

## How to use it

1. Declare the module by defining a name and pointing to the source code:

```terraform
## Subscribe to Marketplace listing
module "subscribe_to_marketplace" {
  source = "github.com/oracle/oci-quickstart-aviatrix/controller/terraform-modules/marketplace"  
  enabled         = "true"                             //true or false
  compartment_id  = "${var.compartment_ocid}"
  product_version = "${var.product_version}"
  license_model   = "${var.license_model}"             //BYOL or PAID
}
```

### Input Variables

These are the input variables required for subscribing to the Marketplace listing:

* enabled: true or false
* compartment_id: OCI Compartment where all infrastructure resources will reside
* product_version: Aviatrix Controller version supported on Oracle Cloud Infrastructure, e.g. "5.0"
* license_model: BYOL or PAID

### Output Variables

These are the values returned by the Marketplace listing application data:

* marketplace_listing_id - App Catalog Listing identifier
* marketplace_resource_id - Global image OCID
* marketplace_resource_version - Marketplace Resource Version
  
## How to maintain these modules

Every time a new version of Aviatrix Controller is published in the Marketplace, [variables.tf](./listings/variables.tf) should be updated with the listing details, available from the Oracle Marketplace Partner portal.
