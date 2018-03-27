Create a new service account key from the GCP [API Manager Credentials page][1],
selecting “Compute Engine default service account” as the Service account and
JSON as the key type. Make sure it has the Role set as Project / Editor.

In a default project setup currently you need to explicitly [enable Google
Kubernetes Engine API][2].

![create_service_account.png][3]

Move and rename the JSON key file into the project `config` directory, eg:

```sh
mv ~/Downloads/xyz-f310a0a6a0bf.json ~/workspace/terraform-kubernetes-on-gcp/config/account.json
```

Make sure the file is named `account.json` as the Terraform config we are
creating later will assume that file to exist.

> DO NOT check the `account.json` file into source-control (it’s already in the
> project's `.gitignore` file to help).

[1]: https://console.cloud.google.com/apis/credentials/serviceaccountkey
[2]: https://console.developers.google.com/apis/library/container.googleapis.com/
[3]: ../images/create_service_account.png
