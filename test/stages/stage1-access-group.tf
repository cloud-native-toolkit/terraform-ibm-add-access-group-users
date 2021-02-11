module "access_groups" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-access-group.git"

  region               = var.region
  resourceGroupNames   = [var.new_resource_group]
  createResourceGroups = true
}
