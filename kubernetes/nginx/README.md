# Kubernetes — Nginx Deployment (YAML Manifest)

## Overview

This project deploys an Nginx web server to a local MicroK8s Kubernetes cluster using a raw YAML manifest. It demonstrates the shift from **imperative** kubectl commands to **declarative** infrastructure definitions.

---

## What This Deploys

| Resource | Type | Detail |
|----------|------|--------|
| nginx | Deployment | 1 replica, nginx:latest image |
| nginx | Service | NodePort, exposed on port 31333 |

---

## Prerequisites

- MicroK8s installed and running (`microk8s status --wait-ready`)
- kubectl alias set: `alias kubectl='microk8s kubectl'`

---

## Imperative vs Declarative

**Imperative (what we started with):**
```bash
microk8s kubectl create deployment nginx --image=nginx
microk8s kubectl expose deployment nginx --port=80 --type=NodePort
```
These commands tell Kubernetes *how* to do it step by step. Nothing is version-controlled or repeatable.

**Declarative (what this project uses):**
```bash
microk8s kubectl apply -f nginx-deployment.yaml
```
The YAML file *is* the infrastructure. Kubernetes reads the desired state and makes it so. Repeatable, auditable, version-controlled.

---

## Deploy
```bash
microk8s kubectl apply -f nginx-deployment.yaml
```

## Verify
```bash
microk8s kubectl get pods
microk8s kubectl get services
```

## Access

## Tear Down
```bash
microk8s kubectl delete -f nginx-deployment.yaml
```

---

## Key Learnings

- A Kubernetes **Deployment** manages the desired number of pod replicas and handles rolling updates
- A **ReplicaSet** is automatically created by the Deployment to maintain pod count
- A **Service** of type `NodePort` exposes the pod externally on a static port
- `kubectl apply` is idempotent — running it multiple times produces the same result
- The YAML file is the **source of truth** — Kubernetes converges to match it
