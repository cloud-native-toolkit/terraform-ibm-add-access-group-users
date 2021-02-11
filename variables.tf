variable "access_groups" {
  type        = string
  description = "Comma-separated list of the groups to which the users should be added"
}

variable "users" {
  type        = string
  description = "Comma-separated list of users"
}
