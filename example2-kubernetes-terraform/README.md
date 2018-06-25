Unfortunately we can't easily use the equivalent of `create-with-container`
using Terraform (see [Github issue][1]) so have to go the Kubernetes route right
away to prevent having a lot of manual deployment steps.

Create a local secrets file using the example provided:

```sh
cp ./secrets.auto.tfvars.example ./secrets.auto.tfvars
```

Let's get Terraform initialised:

```sh
cd example2-kubernetes-terraform/terraform
terraform init -get=true -get-plugins=true
```

Now we can do a dry run with `plan`:

```sh
terraform plan
```

You should see a big block of output similar to this:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + google_compute_firewall.http

...

Plan: 5 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

If it's all green, we can finally `apply`:

```sh
terraform apply
```

Type `yes` when prompted.

If all goes well, after a few minutes you should see some nice green output
like:

```
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

client_certificate = LS0t...
client_key = LS0t...
cluster_ca_certificate = LS0t...
public_ip_address = 35.186.248.173
```

Now you should have a cluster ready for your Kubernetes deployment! Let's have a
look and authenticate:

```
gcloud container clusters list
gcloud container clusters get-credentials terraform-playground-cluster
```

Let's finish with simple nginx test deployment:

```sh
cd ../kubernetes/
kubectl apply -f deployment.yaml
kubectl apply -f ingress.yaml
kubectl apply -f service.yaml
```

[1]: https://github.com/terraform-providers/terraform-provider-google/issues/1022
