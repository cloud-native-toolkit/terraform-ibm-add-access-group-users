module "admin-users" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-account-users.git"

  users = split(",", var.admin-users)
}

module "edit-users" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-account-users.git"

  users = split(",", var.edit-users)
}
