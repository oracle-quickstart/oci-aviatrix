variable "enabled" {}
variable "license_model" {}
variable "product_version" {}

# Aviatrix Controller Marketplace listing IDs

variable "mp_listings" {
  type = "map"

  default = {
    "PAID" = "ocid1.appcataloglisting.oc1..aaaaaaaawdptz5o42tuhg62defjimphzuck4fbrz4cilez2mle3bcs5t22wa"
    "BYOL" = "ocid1.appcataloglisting.oc1..aaaaaaaavalzcaxbs4hwta4uefnkdh7fjgd3uuw7lwlk6pn2uvzglrn3zt2a"
  }
}

#Product version <-> Marketplace Package Version Reference

variable "mp_paid_versions" {
  type = "map"

  default = {
    "5.0" = "5.0"
  }
}

variable "mp_byol_versions" {
  type = "map"

  default = {
    "5.0" = "5.0-090420192309"
  }
}

# Package Version <-> Global Image OCID

variable "mp_paid_listing_resource_id" {
  type = "map"

  default = {
    "5.0" = "ocid1.image.oc1..aaaaaaaas4ycaortf6duoq7jqvxr53sejoc6olq6mnds43qxnvx5a246x5fa"
  }
}

variable "mp_byol_listing_resource_id" {
  type = "map"

  default = {
    "5.0-090420192309" = "ocid1.image.oc1..aaaaaaaazazftgkqv5rgglks5uidsp2dlf7laydczwb3xh7lepwvaw22djoq"
  }
}
