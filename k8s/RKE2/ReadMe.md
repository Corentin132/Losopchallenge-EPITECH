# Kubernetes Infrastructure Deployment Documentation with RKE2

# RKE2 Installation & Setup

## Server node setup

1.  Run the installer:
    `curl -sfL https://get.rke2.io | sh -`
2.  Enable the rke2-server service:
    `systemctl enable rke2-server.service`
3.  Start the service:
    `systemctl start rke2-server.service`

## Worker node setup

1. Run the installer:
   `curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh -`
2. Enable the rke2-agent service:
   `systemctl enable rke2-agent.service`
3. Configure the rke2-agent service:
   `mkdir -p /etc/rancher/rke2/; vim /etc/rancher/rke2/config.yaml`
   `server: https://<server>:9345; token: <token from server node>`
4. Start the service:
   `systemctl start rke2-agent.service`

## Preamble

This guide aims to provide detailed documentation for deploying a Kubernetes infrastructure using RKE2 (Rancher Kubernetes Engine 2) and provided YAML files.

## Prerequisites

Before you begin, make sure you have the following:

An RKE2 cluster: Ensure you have a functioning RKE2 cluster and that you have administrative rights to perform deployments.

kubectl: Ensure that kubectl is installed and configured to communicate with your RKE2 cluster.

## Setup Argocd

Argo CD and deploy it using its official YAML manifest.

## Prerequisites

Before you begin, you need to have the following installed:

- `kubectl`: The Kubernetes command-line tool, `kubectl`, allows you to run commands against Kubernetes clusters. You can find installation instructions at [Kubernetes.io](https://kubernetes.io/docs/tasks/tools/).

## Installation Steps

### Step 1: Create the Argo CD Namespace

Argo CD components should be installed in their own namespace to isolate them from other applications. Use the following command to create a new namespace called `argocd`:

```bash
kubectl create namespace argocd
```

This command creates a new namespace named `argocd` where all the Argo CD resources will reside.

### Step 2: Deploy Argo CD

To install Argo CD, apply the YAML file from the official Argo Project repository. This file contains all the necessary resources to run Argo CD. Run the following command to apply this YAML file within the `argocd` namespace:

```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

This command downloads the latest stable version of the Argo CD manifest and applies it to your Kubernetes cluster under the `argocd` namespace.

## Verification

To ensure that Argo CD has been installed correctly, you can check the resources in the `argocd` namespace:

```bash
kubectl get all -n argocd
```

This command lists all the resources (pods, services, deployments, etc.) created under the `argocd` namespace, showing you the status of Argo CD components.

## Accessing Argo CD

Then apply the ingress from the config file

## Config file

YAML File Structure
Here are the YAML files you provided:

- db-deployment.yaml: Deployment for a database.

- db-service.yaml: Service to expose the database.

- tls-ingress.yaml: Ingress configuration to handle TLS traffic.

- tls-secret.yaml: Secret containing the TLS certificates.

- web-client-configMap.yaml: ConfigMap for the web client configuration.

- web-client-deployment.yaml: Deployment for the web client.

- web-client-service.yaml: Service to expose the web client.

- argocd-ingress.yaml: Ingress configuration to argocd.

- argoc-secret.yaml: If custom TLS certificate needed for argocd.

## Usage/Examples

```
kubectl apply -f config-filename.yaml
```

## Conclusion

Apply all this files to your rke2 cluster and then you are ready to access all the services listed ! 😇
