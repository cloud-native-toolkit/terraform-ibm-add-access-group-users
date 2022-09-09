module "access_groups" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-access-group.git"

  ibmcloud_api_key    = var.ibmcloud_api_key
  #resource_group_name = var.resource_group_name
  resource_group_name = module.access_groups.resource_group_name

}
