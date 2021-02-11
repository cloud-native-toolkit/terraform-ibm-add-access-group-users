module "admin-group" {
  source = "./module"

  users = module.admin-users.users
  access_groups = module.access_groups.adminGroupNames
}

module "edit-group" {
  source = "./module"

  users = module.edit-users.users
  access_groups = module.access_groups.userGroupNames
}
