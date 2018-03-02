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

### Google Cloud Platform project

Create a new service account key and download as `account.json` to `config`.

[More info and step by step guide with screenshots here.][3]

### Google Cloud command-line tool, `gcloud`

You can either install it from the [official source][6] or using Homebrew Cask
if you’re on a Mac:

```sh
brew tap caskroom/cask
brew cask install google-cloud-sdk
```

Once it’s installed, log in:

```sh
gcloud auth application-default login
```

### Terraform

* Terraform CLI 0.11+
* A GCP service account key

Download the Terraform CLI [from their site][4], or install it using
[Homebrew][5] is you’re on a Mac:

```sh
brew install terraform
```

### Kubernetes command-line tool, `kubectl`

You can either install it from the [official source][7] or using Homebrew if
you’re on a Mac:

```sh
brew install kubernetes-cli
```

## Exercise 1 - Deploying a single Docker image to GCP with `gcloud`

This exercise gets us started with deploying a single Docker image to GCP using
the `gcloud` CLI.

[Let’s do it, onwards to Exercise 1!][8]

## Exercise 2 - Deploying a single Docker image to GCP with Terraform

Now instead of the `gcloud` CLI we’ll use Terraform.

[Let’s do it, onwards to Exercise 2!][9]

## Exercise 3 - Deploying Kubernetes to GCP with Terraform

We’re ready to take on Kubernetes!

[Let’s do it, onwards to Exercise 3!][10]

## Exercise 4 - Deploying an autoscaling Kubernetes services to GCP with Terraform

Let’s make it a bit more powerful example and autoscale!

[Let’s do it, onwards to Exercise 4!][11]

[1]: https://www.terraform.io/
[2]: https://www.terraform.io/docs/providers/google/
[3]: ./docs/gcp.md
[4]: https://www.terraform.io/downloads.html
[5]: https://brew.sh/
[6]: https://cloud.google.com/sdk/
[7]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[8]: ./example1-single-docker-gcloud
[9]: ./example2-single-docker-terraform
[10]: ./example3-kubernetes-terraform
[11]: ./example4-autoscaling-services
