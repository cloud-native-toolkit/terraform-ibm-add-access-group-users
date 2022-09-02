module "admin-group" {
  source = "./module"

  users = module.admin-users.users
  depends_on = [
    module.access_groups
  ]
  access_groups = module.access_groups.adminGroupNames
}

#https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-access-group/blob/main/outputs.tf

module "edit-group" {
  source = "./module"

  users = module.edit-users.users
  depends_on = [
    module.access_groups
  ]
  access_groups = module.access_groups.editGroupNames
}

module "view-group" {
  source = "./module"

  users = module.view-users.users
  depends_on = [
    module.access_groups
  ]
  #access_groups = module.access_groups.viewGroupNames
  
  access_groups = module.access_groups.viewGroupNames

}
