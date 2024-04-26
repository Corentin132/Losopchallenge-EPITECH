# Continuous Integration (CI) Workflows Documentation

This document provides an overview of the Continuous Integration workflows used in the project. Each workflow is designed to perform specific tasks whenever certain GitHub events occur, such as pushing to branches or creating pull requests.

## 1. Mirroring

This workflow is responsible for mirroring the repository to a specific GitHub repository whenever changes are pushed to the main branch.

### Triggers:

- Push to the main branch.

### Jobs:

#### Mirroring to Epitech GitHub

- Environment: Runs on the latest Ubuntu.
- Steps:
    - Checkout repository: Uses actions/checkout@v4.
    - Mirroring to Epitech GitHub: Mirrors the repository using pixta-dev/repository-mirroring-action@v1, with credentials provided via secrets.

## 2. CI - Lint PR

This workflow is triggered on pull request events and is designed to validate pull request titles to ensure they follow semantic versioning.

### Triggers:

- Pull Request: Opened, edited, or synchronized.

### Jobs:

#### Validate PR Title

- Environment: Runs on the latest Ubuntu.
- Steps:
    - Validate PR title: Checks if the pull request title matches the semantic pull request criteria using amannn/action-semantic-pull-request@v5.

## 3. CI - Build, Test and Scan

This workflow is triggered on push events to any branch and pull request events to all branches.

### Triggers:

- Push to any branch.
- Pull Request to any branch.

### Jobs:

#### Build, Test and Scan

- Environment: Runs on the latest Ubuntu.
- Steps:
    - Checkout repository: Uses actions/checkout@v4.
    - Start containers: Starts necessary Docker containers using docker-compose, sets up environment variables, and retrieves the Docker container ID and image name.
    - Run migrations: Executes database migrations inside the Docker container.
    - Run tests: Performs tests using the application's testing framework.
    - Run Trivy image vulnerability scanner: Scans the Docker image for vulnerabilities with specific severity.
    - Run Trivy IaC vulnerability scanner: Scans the infrastructure-as-code configurations for vulnerabilities.

## 4. CI - Release Version and Deploy to Docker Hub

This workflow runs after the "CI - Build, test and scan" workflow has completed successfully. It handles the release of new versions and deploys them to Docker Hub.

### Triggers:

- Workflow Run: On completion of the "CI - Build, test and scan" workflow on the main branch.

### Jobs:

#### Release Version

- Environment: Runs on the latest Ubuntu.
- Steps:
    - Checkout repository: Uses actions/checkout@v4.
    - Setup Node.js: Sets up Node.js environment.
    - Run semantic-release: Automates version management and package publishing.

#### Deploy to Docker Hub

- Environment: Runs on the latest Ubuntu.
- Steps:
    - Checkout repository: Uses actions/checkout@v4.
    - Login to DockerHub: Authenticates to Docker Hub.
    - Build and push Docker image: Builds the Docker image and pushes it to Docker Hub with the tags for the latest and specific versions.

## 5. CD - Update Image Version and Job Name

This workflow updates the Kubernetes deployment and job YAML configurations with the new Docker image version whenever a new release is published.

### Triggers:

Release: Published on the main branch.

### Jobs:

#### Update Image Version and Job Label Version

- Environment: Runs on the latest Ubuntu.
- Steps:
    - Checkout repository: Uses actions/checkout@v4.
    - Update image version and job name: Updates the Docker image version and job name in Kubernetes configuration files and commits the changes.

## 6. ArgoCD - Sync Application

Understanding ArgoCD in a GitOps Environment

ArgoCD is a declarative, GitOps continuous delivery tool that automates the deployment of applications to various target environments. Its core principle revolves around using Git repositories as the source of truth for defining the infrastructure and application configurations. In this setup, ArgoCD continuously monitors repositories for changes and synchronizes those changes to the target environments, ensuring that the configuration in Git matches the deployed environment. This method offers numerous benefits and operates under the GitOps philosophy to enhance automation, security, and reliability in software deployments.
Why ArgoCD Updates Files for CD in a GitOps Framework

- Immutable Infrastructure: In a GitOps-driven process, infrastructure is treated as immutable. Rather than manually changing live environments, you change the code that describes them. When ArgoCD detects these changes in a Git repository, it systematically updates the environments to match the desired state defined in Git. This immutability reduces inconsistencies between the deployment environments and decreases the chances of drift.

- Audit Trails and Rollback Capabilities: With ArgoCD, every change is recorded in a Git commit. This creates an automatic audit trail for every change made to the infrastructure or deployments. If something goes wrong, it’s easy to rollback to a previous state by reverting to a previous Git commit. This not only enhances security but also simplifies the process of tracking changes and understanding their impact.

- Enhanced Security: Using Git as the central mechanism for initiating changes means that standard security practices applied to source code management (like SSH keys, two-factor authentication, and pull request reviews) are extended to the management of the infrastructure. This limits direct access to the live environment, reducing the risk of unauthorized changes.

- Automated and Reliable Deployments: ArgoCD automates the deployment process by continuously checking for changes in the Git repository and applying these changes to the target environments. This reduces the possibility of human error and ensures that deployments are consistent and repeatable across different environments. The "declarative setup" means that ArgoCD applies all configurations in the order they are defined and maintains the state, even in the case of interruptions or failures.

- Decentralized Management: Since the Git repository can be accessed by multiple teams, ArgoCD allows for decentralized management of deployments. Teams can manage their own configurations and deployments through pull requests. This empowers teams to be autonomous while still maintaining central oversight, as changes can be reviewed and approved according to organizational policies.

- Continuous Feedback Loop: ArgoCD provides a real-time, continuous feedback loop on the state of applications and their synchronization status with the Git repository. This visibility is crucial for maintaining the reliability of systems and for quick diagnostics and troubleshooting.

By continuously synchronizing the deployment environment with the state defined in Git, ArgoCD not only simplifies the management of deployments but also aligns with the best practices of modern software development. It ensures that the entire process—from code commit to production—is streamlined, secure, and manageable, making it an invaluable tool in the arsenal of modern DevOps teams. This GitOps approach not only optimizes operational efficiencies but also significantly reduces the chances of errors and misconfigurations, thereby enhancing overall system stability and reliability.