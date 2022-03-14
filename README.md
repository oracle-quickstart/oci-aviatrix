# **This repo is archived and should no longer be used**
# **Please see https://github.com/AviatrixSystems/terraform-module-oci instead.**


# oci-aviatrix

These are Terraform modules that deploys [Aviatrix Secure Networking Platform](https://docs.aviatrix.com/StartUpGuides/oracle-aviatrix-cloud-controller-startup-guide.html) on [Oracle Cloud Infrastructure (OCI)]((https://cloud.oracle.com/en_US/cloud-infrastructure)). It is developed jointly by Oracle and Aviatrix.

The Aviatrix cloud network solution consists of two components, the controller and gateways, both of which are cloud VMs available on the Oracle Cloud Infrastructure Marketplace. Gateways are launched from the controller console to specific VCNs.

## Aviatrix Controller

Detailed instructions for deploying Aviatrix Controller on Oracle Cloud Infrastructure can be found in the [Controller](./controller/README.md) space.

## Terraform Version

* master branch is for Terraform v0.12+
* v0.11  branch is for Terraform v0.11+
