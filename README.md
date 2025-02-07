# n8n Helm Chart

This repository contains a Helm chart for deploying [n8n](https://n8n.io/) on Kubernetes. n8n is an open-source workflow automation tool that allows you to connect various services and automate tasks.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)



## Prerequisites

Before you begin, ensure you have the following installed:

- [Helm](https://helm.sh/docs/intro/install/)
- A Kubernetes cluster (e.g., [Minikube](https://minikube.sigs.k8s.io/docs/start/) or [GKE](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-cluster))
- Access to a PostgreSQL database (for n8n's data storage)
- Access to a Redis instance (optional, for queue management)

## Installation

To install the n8n Helm chart, follow these steps:

1. **Install the chart**:
   ```bash
   helm install my-n8n charts/n8n
   ```

   Replace `my-n8n` with your desired release name.

2. **Verify the installation**:
   ```bash
   kubectl get pods -n n8n
   ```

   Ensure that all pods are running.

## Configuration

You can customize the deployment by modifying the `values.yaml` file. Below are some key configuration options:

- **Image Configuration**:
  - `image.repository`: The Docker repository for n8n.
  - `image.tag`: The version of n8n to deploy.

- **Ingress Configuration**:
  - `ingress.enabled`: Set to `true` to enable ingress.
  - `ingress.host`: The host for your n8n instance.

- **Database Configuration**:
  - `config.database.type`: The type of database (e.g., `postgresdb`).
  - `config.database.host`: The hostname of your PostgreSQL database.
  - `config.database.user`: The username for your database.
  - `config.database.password`: The password for your database.

- **Redis Configuration**:
  - `config.redis.host`: The hostname of your Redis instance.
  - `config.redis.deployment.enabled`: Set to `true` to deploy Redis locally.

- **Webhook Configuration**:
  - `config.webhook.url`: The URL for the n8n webhook.

### Example Custom Values

You can create a custom `values.yaml` file to override the default settings:

```yaml
image:
tag: "0.200.0" # Specify the desired n8n version
ingress:
enabled: true
host: n8n.example.com
config:
database:
host: postgres.example.com
user: n8n_user
password: n8n_password
redis:
host: redis.example.com
```