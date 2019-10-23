variable "enabled" {
  type = bool
  default = true
}

variable "license_model" {
}

variable "product_version" {
}

# Aviatrix Controller Marketplace listing IDs

variable "mp_listings" {
  type = map(string)

  default = {
    "PAID" = "ocid1.appcataloglisting.oc1..aaaaaaaawdptz5o42tuhg62defjimphzuck4fbrz4cilez2mle3bcs5t22wa"
    "BYOL" = "ocid1.appcataloglisting.oc1..aaaaaaaavalzcaxbs4hwta4uefnkdh7fjgd3uuw7lwlk6pn2uvzglrn3zt2a"
  }
}

#Product version <-> Marketplace Package Version Reference

variable "mp_paid_versions" {
  type = map(string)

  default = {
    "5.0.1" = "5.0.1"
  }
}

variable "mp_byol_versions" {
  type = map(string)

  default = {
    "5.0.1" = "5.0.1"
  }
}

# Package Version <-> Global Image OCID

variable "mp_paid_listing_resource_id" {
  type = map(string)

  default = {
    "5.0.1" = "ocid1.image.oc1..aaaaaaaa3zkysxdvsyb76plwj4tw54iiibozlfq3quwgiveeaqdscwmtwgoa"
  }
}

variable "mp_byol_listing_resource_id" {
  type = map(string)

  default = {
    "5.0.1" = "ocid1.image.oc1..aaaaaaaaltulqugc5ygggevy3ig7mv2io75azdareylypx23ezhvonqgrcrq"
  }
}

