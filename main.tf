locals {
  access_groups = split(",", var.access_groups)
  users = split(",", var.users)
}

data ibm_iam_access_group access_groups {
  count             = length(local.access_groups)
  access_group_name = local.access_groups[count.index]
}

resource ibm_iam_access_group_members group_members {
  count = length(local.access_groups)

  access_group_id = element(data.ibm_iam_access_group.access_groups.*.groups.0.id, count.index)
  ibm_ids         = local.users
}
