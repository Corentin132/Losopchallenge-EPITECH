## How to setup on new machine

1. **Install Required Tools**:
    - [Terraform](https://www.terraform.io/downloads.html)

2. **Setup your SSH key in the project, the private key should be named `nsa-key`**:
    - `ssh-keygen -t rsa -b 4096 -C "
    - `mv ~/.ssh/id_rsa /path/to/this/project/nsa-key`
    - `chmod 600 /path/to/this/project/nsa-key`

3. **Run terraform to create the infrastructure**:
    - `terraform init`
    - `terraform apply`

4. **Install RKE to initialize the Kubernetes cluster**:
    - See more [here](../k8s/RKE2/ReadMe.md)
   
5. **Link the repository on ArgoCD**:
   # TODO

6. **Access the application**:
Setup the local host on your `/etc/hosts` file:
```
<ip of master node> lostop.com
```

Thanks to ingress, you can access the application at `https://lostop.com` and ArgoCD at `https://argocd.lostop.com`
