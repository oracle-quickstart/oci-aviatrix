variable "marketplace_source_images" {
  type = map(object({
    ocid = string
    is_pricing_associated = bool
    compatible_shapes = set(string)
  }))
  default = {
    main_mktpl_image = {
      ocid = "ocid1.image.oc1..aaaaaaaawyzirrayoeo5ivzkf57texkiu44ytnfifkmzry2xm5uu4otfk7cq"
      is_pricing_associated = false
      compatible_shapes = []
    }
  }
}