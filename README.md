# Running Kubernetes on Google Cloud Platform using Terraform

## Terraform

Infrastructure is managed using [Terraform][1] via the [Google Cloud
provider][2], which handles resources such as:

* CloudDNS and compute addresses
* Container clusters
* Networking

## Kubernetes

Cluster components and some cluster-specific infrastructure resources are
managed through Kubernetes:

* App deployments, services and ingress
* GCP load balancers (via ingress)
* Cache stateful sets
* Secrets for the app and SSL certificates
* Autoscaling

## Prerequisites

### Google Cloud Platform

Create a new service account key from the GCP [API Manager Credentials page][3],
selecting “Compute Engine default service account” as the Service account and
JSON as the key type.

Move and rename the JSON key file into the project `terraform` directory, eg:

```sh
mv ~/Downloads/xyz-f310a0a6a0bf.json ~/workspace/terraform-kubernetes-on-gcp/terraform/account.json
```

Make sure the file is named `account.json` as the Terraform `providers.tf` is
expecting that file to exist.

> DO NOT check the `account.json` file into source-control (it’s already in the
> project's `.gitignore` file to help).

#### Environment variables

Set GCLOUD_REGION and GCLOUD_ZONE to where you want resources to be created,
otherwise defaults will be used.

TODO: check if GCP project gets picked up from credentials JSON

### Terraform

* Terraform CLI 0.11+
* A GCP service account key

Download the Terraform CLI [from their site][4], or install it using
[Homebrew][5] is you’re on a Mac:

```sh
brew install terraform
cd terraform
terraform get
terraform init
```

### Kubernetes

### Google Cloud command-line tool, `gcloud`

You can either install it from the [official source][6] or using Homebrew Cask
if you’re on a Mac:

```sh
brew tap caskroom/cask
brew cask install google-cloud-sdk
```

### Kubernetes command-line tool, `kubectl`

You can either install it from the [official source][7] or using Homebrew if
you’re on a Mac:

```sh
brew install kubernetes-cli
```

## Exercise 1

TODO

[1]: https://www.terraform.io/
[2]: https://www.terraform.io/docs/providers/google/
[3]: https://console.cloud.google.com/apis/credentials/serviceaccountkey
[4]: https://www.terraform.io/downloads.html
[5]: https://brew.sh/
[6]: https://cloud.google.com/sdk/
[7]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
