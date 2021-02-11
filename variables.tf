variable "access_groups" {
  type        = list(string)
  description = "List of the groups to which the users should be added"
}

variable "users" {
  type        = list(string)
  description = "List of users"
}
