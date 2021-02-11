#!/usr/bin/env bash

set -e

ibmcloud login --apikey "${IBMCLOUD_API_KEY}" -r us-east

RESOURCE_GROUP=$(cat ./terraform.tfvars | grep "new_resource_group" | sed -E "s/.*=//g" | sed 's/"//g')

echo "Resource group: ${RESOURCE_GROUP}"

ACCESS_GROUP_BASE=$(echo "${RESOURCE_GROUP}" | sed "s/-/_/g" | tr '[:lower:]' '[:upper:]')

echo "Access group base: ${ACCESS_GROUP_BASE}"

ADMIN_ACCESS_GROUP="${ACCESS_GROUP_BASE}_ADMIN"
EDIT_ACCESS_GROUP="${ACCESS_GROUP_BASE}_EDIT"
VIEW_ACCESS_GROUP="${ACCESS_GROUP_BASE}_VIEW"

ADMIN_USER_LIST=$(cat ./input.auto.tfvars | grep "admin-users" | sed -E "s/.*=//g" | sed 's/"//g')
EDIT_USER_LIST=$(cat ./input.auto.tfvars | grep "edit-users" | sed -E "s/.*=//g" | sed 's/"//g')
VIEW_USER_LIST=$(cat ./input.auto.tfvars | grep "view-users" | sed -E "s/.*=//g" | sed 's/"//g')

IFS=',' read -ra ADMIN_USERS <<< "${ADMIN_USER_LIST}"
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

IFS=',' read -ra EDIT_USERS <<< "${EDIT_USER_LIST}"
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

IFS=',' read -ra VIEW_USERS <<< "${VIEW_USER_LIST}"
for user in "${VIEW_USERS[@]}"; do
  if ! ibmcloud account users | grep -qi "${user}"; then
    echo "User not added to account: ${user}"
    exit 1
  fi

  if ! ibmcloud iam access-group-users "${VIEW_ACCESS_GROUP}" | grep -qi "${user}"; then
    echo "User not added to access group: ${user}, ${VIEW_ACCESS_GROUP}"
    exit 1
  fi
done
