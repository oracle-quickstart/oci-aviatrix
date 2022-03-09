variable "marketplace_source_images" {
  type = map(object({
    ocid = string
    is_pricing_associated = bool
    compatible_shapes = set(string)
  }))
  default = {
    main_mktpl_image = {
      ocid = "ocid1.image.oc1..aaaaaaaaltulqugc5ygggevy3ig7mv2io75azdareylypx23ezhvonqgrcrq"
      is_pricing_associated = false
      compatible_shapes = []
    }
  }
}