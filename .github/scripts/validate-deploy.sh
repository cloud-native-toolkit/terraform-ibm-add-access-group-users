#!/usr/bin/env bash

set -x

ibmcloud login --apikey "${IBMCLOUD_API_KEY}" -r us-east

source ./terraform.tfvars
source ./input.auto.tfvars

ACCESS_GROUP_BASE=$(echo "${new_resource_group}" | sed "s/-/_/g" | tr '[:lower:]' '[:upper:]')
ADMIN_ACCESS_GROUP="${ACCESS_GROUP_BASE}-ADMIN"
EDIT_ACCESS_GROUP="${ACCESS_GROUP_BASE}-USER"

IFS=',' read -ra ADMIN_USERS <<< "${admin-users}"
for user in "${ADMIN_USERS[@]}"; do
  if ! ibmcloud account users | grep -qi "${user}"; then
    echo "User not added to account: ${user}"
    exit 1
  fi

  if ! ibmcloud iam access-group-users "${ADMIN_ACCESS_GROUP}" | grep -qi "${user}"; then
    echo "User not added to access group: ${user}, ${ADMIN_ACCESS_GROUP}"
    exit 1
  fi
done

IFS=',' read -ra EDIT_USERS <<< "${edit-users}"
for user in "${EDIT_USERS[@]}"; do
  if ! ibmcloud account users | grep -qi "${user}"; then
    echo "User not added to account: ${user}"
    exit 1
  fi

  if ! ibmcloud iam access-group-users "${EDIT_ACCESS_GROUP}" | grep -qi "${user}"; then
    echo "User not added to access group: ${user}, ${EDIT_ACCESS_GROUP}"
    exit 1
  fi
done
