#!/usr/bin/env bash

# terraform.sh - wrapper for initializing infra with Terraform

_TERRAFORM_FILE="example.tf"

set -e errexit
set -o pipefail

# check if terraform binary is available on system PATH:
if [[ -z $(command -v terraform) ]]; then
  echo "'terraform' binary not found on your system PATH. Please make sure you installed it correctly"
  echo "Aborting now..."
  exit 1
fi

echo -n "Checking for mandatory env vars..."
# Terraform needs two defined environment variables to authenticate on AWS:
# AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
# checking them now:
if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
  echo "'AWS_ACCESS_KEY_ID' env var not set"
  echo "Aborting now..."
  exit 1
fi
if [[ -z "${AWS_SECRET_ACCESS_KEY}" ]]; then
  echo "'AWS_SECRET_ACCESS_KEY' env var not set"
  echo "Aborting now..."
  exit 1
fi
echo "Environment vars OK"

# checking TF file is here:
echo -n "Checking for Terraform file..."
if [[ ! -f "${_TERRAFORM_FILE}" ]]; then
  echo "Terraform file '${_TERRAFORM_FILE}' not found at '$(pwd)'"
  echo "Aborting now..."
  exit 1
fi
echo "Terraform file found: '$(ls "$PWD"/"$_TERRAFORM_FILE")'"

# initializing since terraform plugins are binaries and should not be versioned:
terraform init

# now invoking 'terraform plan' to make sure TF file has no errors and authentication is OK:
terraform plan

# applying - effectively creating the resource as described in "_TERRAFORM_FILE":
terraform apply
