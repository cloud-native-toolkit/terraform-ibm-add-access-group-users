module "admin-group" {
  source = "./module"

  users = module.admin-users.users
  access_groups = module.access_groups.view_group_name
}

module "edit-group" {
  source = "./module"

  users = module.edit-users.users
  access_groups = module.access_groups.view_group_name
}

module "view-group" {
  source = "./module"

  users = module.view-users.users
  access_groups = module.access_groups.view_group_name
}
