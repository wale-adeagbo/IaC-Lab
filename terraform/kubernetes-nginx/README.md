# Terraform — Kubernetes Nginx Deployment

## Overview

This project provisions the same Nginx deployment and NodePort service from the [kubernetes/nginx](../../kubernetes/nginx/) project — but entirely through **Terraform**. No kubectl commands. No manual YAML. Terraform owns the infrastructure.

---

## What This Provisions

| Resource | Terraform Type | Detail |
|----------|---------------|--------|
| nginx | kubernetes_deployment | 1 replica, nginx:latest |
| nginx | kubernetes_service | NodePort, port 31333 |

---

## Prerequisites

- MicroK8s running (`microk8s status --wait-ready`)
- Terraform installed (`terraform -version`)
- kubeconfig generated:
```bash
microk8s config > ~/.kube/config
```

---

## Why Terraform Over Raw YAML?

| Raw YAML (kubectl) | Terraform (HCL) |
|-------------------|-----------------|
| Apply manually | Plan, then apply |
| No state tracking | Full state management |
| Hard to reuse | Variables and modules |
| No drift detection | Detects config drift |
| kubectl only | Multi-provider (AWS, Azure, K8s) |

---

## Usage

**Initialise Terraform (first time only):**
```bash
terraform init
```

**Preview changes:**
```bash
terraform plan
```

**Apply infrastructure:**
```bash
terraform apply
```

**Verify:**
```bash
microk8s kubectl get pods
microk8s kubectl get services
```

**Access:**
http://localhost:31333/

**Destroy infrastructure:**
```bash
terraform destroy
```

---

## File Structure
terraform/kubernetes-nginx/
├── main.tf          # Provider config + all resources
├── variables.tf     # Input variables (coming soon)
├── outputs.tf       # Output values (coming soon)
└── README.md        # This file

> **Note:** `.terraform/`, `terraform.tfstate`, and `terraform.tfstate.backup` are excluded via `.gitignore`. Never commit state files — they can contain sensitive data.

---

## Key Learnings

- `terraform init` downloads the required provider plugins
- `terraform plan` is a dry run — always run this before applying
- `terraform apply` provisions the infrastructure and writes to state
- `terraform.tfstate` is Terraform's memory — it tracks what it owns
- If you manually delete a resource Kubernetes-side, `terraform apply` will recreate it — **Terraform is always the source of truth**
- The `-out=tfplan` flag saves a plan file for guaranteed consistent applies (production best practice)
