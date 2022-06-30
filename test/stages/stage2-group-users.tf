module "admin-group" {
  source = "./module"

  users = module.admin-users.users
  depends_on = [
    module.access_groups
  ]
}

module "edit-group" {
  source = "./module"

  users = module.edit-users.users
  depends_on = [
    module.access_groups
  ]
}

module "view-group" {
  source = "./module"

  users = module.view-users.users
  depends_on = [
    module.access_groups
  ]
}
