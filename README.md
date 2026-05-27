
# IaC-Lab #

**Infrastructure as Code | Kubernetes | Terraform | Ansible**  
*A structured, hands-on lab documenting progression from manual infrastructure management to fully code-driven operations.*

---

## Why This Repo Exists

As an IT Operations professional, I've managed infrastructure across multi-site organisations for 8+ years. This lab exists to deepen ( and help others deepen their) hands-on IaC engineering skills — moving beyond tool familiarity into production-grade, repeatable infrastructure definitions.

Every project here is built, tested, and documented on a real Ubuntu machine running a local Kubernetes cluster. Nothing is theoretical.

---

## Lab Environment

| Component | Detail |
|-----------|--------|
| OS | Ubuntu 24 (host: Maximus) |
| Kubernetes | MicroK8s v1.35.0 |
| IaC Tool | Terraform v1.10.5 |
| Config Management | Ansible (in progress) |
| Container Runtime | containerd |

---

## Projects

### 1. Kubernetes — Manual Deployments
> Deploying and managing workloads using `kubectl` and raw YAML manifests.

| Project | Description |
|---------|-------------|
| [nginx-deployment](./kubernetes/nginx/) | Deploy and expose Nginx using a Kubernetes YAML manifest |

**Skills:** Kubernetes, kubectl, YAML, Deployments, Services, NodePort

---

### 2. Terraform — Infrastructure as Code
> Provisioning Kubernetes resources declaratively using Terraform's Kubernetes provider.

| Project | Description |
|---------|-------------|
| [kubernetes-nginx](./terraform/kubernetes-nginx/) | Provision an Nginx deployment and NodePort service via Terraform |

**Skills:** Terraform, HCL, Kubernetes provider, `terraform plan`, `terraform apply`, state management

---

### 3. Ansible — Configuration Management
> Automating configuration and application deployment using Ansible playbooks.

| Project | Description |
|---------|-------------|
| [playbook.yml](./ansible/playbook.yml) | Install and verify Nginx is running on the local machine |
| [deploy-webpage.yml](./ansible/deploy-webpage.yml) | Deploy a custom HTML page through Nginx |

**Skills:** Ansible, YAML playbooks, inventory, idempotency, apt module, service module, copy module

---

## Progression

```
Manual kubectl commands
        ↓
YAML manifests (declarative Kubernetes)
        ↓
Terraform (infrastructure as code)
        ↓
Ansible (configuration management)
        ↓
Full IaC pipeline (Terraform + Ansible + Kubernetes)
```

---

## Key Concepts Covered

- **Imperative vs Declarative** infrastructure management
- **Desired state** — Kubernetes and Terraform both converge to what you define
- **Infrastructure as Code** — version-controlled, repeatable, auditable
- **State management** — how Terraform tracks what it owns
- **Provider ecosystem** — extending Terraform to manage Kubernetes resources

---

## Related Projects

- [Homelab](https://github.com/wale-adeagbo/homelab) — Enterprise-grade lab covering AD, monitoring, SIEM, and cloud integration
- [Incident-Response-Playbook](https://github.com/wale-adeagbo/Incident-Response-Playbook) — Versioned runbooks for common incident types
- [Change-Management-Workflow](https://github.com/wale-adeagbo/Change-Management-Workflow) — ITIL-aligned change process using GitHub Projects

---

*"Infrastructure that isn't documented and version-controlled is infrastructure that only one person understands."*
