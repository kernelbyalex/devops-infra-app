#!/bin/bash
set -e

echo "🧹 Destroying Terraform infrastructure..."
terraform destroy -auto-approve

echo "🧼 Removing local Terraform state files..."
rm -rf .terraform terraform.tfstate* .terraform.lock.hcl

echo "✅ Cleanup complete."

