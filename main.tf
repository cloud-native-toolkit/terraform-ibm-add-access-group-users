
data ibm_iam_access_group access_groups {
  count             = length(var.access_groups)
  access_group_name = var.access_groups[count.index]
}

resource ibm_iam_access_group_members group_members {
  count = length(var.access_groups)

  access_group_id = element(data.ibm_iam_access_group.access_groups.*.groups.0.id, count.index)
  ibm_ids         = var.users
}

resource null_resource print_users {
  provisioner "local-exec" {
    command = "echo 'List of users : ${var.users}' 'AG: ${access_group_name}'"
  }
}