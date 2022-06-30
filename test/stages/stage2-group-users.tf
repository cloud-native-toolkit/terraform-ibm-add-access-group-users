module "admin-group" {
  source = "./module"

  users = module.admin-users.users
  access_groups = module.access_groups[count.index]
}

module "edit-group" {
  source = "./module"

  users = module.edit-users.users
  access_groups = module.access_groups[count.index]
}

module "view-group" {
  source = "./module"

  users = module.view-users.users
  access_groups = module.access_groups[count.index]
}
