module "access_groups" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-access-group.git"
  resource_group_name = var.resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key 
}
