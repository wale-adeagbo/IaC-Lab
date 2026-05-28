#!/bin/bash

echo "============================================"
echo "  IaC Full Pipeline - Starting"
echo "============================================"

# Step 1 - Terraform
echo ""
echo "[1/2] Running Terraform..."
cd ~/IaC-Lab/terraform/kubernetes-nginx
terraform init -input=false
terraform apply -auto-approve

if [ $? -ne 0 ]; then
  echo "Terraform failed. Aborting pipeline."
  exit 1
fi

echo ""
echo "[2/2] Running Ansible..."
cd ~/IaC-Lab/ansible
ansible-playbook -i inventory.ini playbook.yml
ansible-playbook -i inventory.ini deploy-webpage.yml

if [ $? -ne 0 ]; then
  echo "Ansible failed."
  exit 1
fi

echo ""
echo "============================================"
echo "  Pipeline Complete"
echo "  Kubernetes Nginx: http://localhost:31333"
echo "  Ansible Nginx:    http://localhost"
echo "============================================"
