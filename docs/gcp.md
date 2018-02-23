Create a new service account key from the GCP [API Manager Credentials page][1],
selecting “Compute Engine default service account” as the Service account and
JSON as the key type.

Move and rename the JSON key file into the project `config` directory, eg:

```sh
mv ~/Downloads/xyz-f310a0a6a0bf.json ~/workspace/terraform-kubernetes-on-gcp/config/account.json
```

Make sure the file is named `account.json` as the Terraform config we are
creating later will assume that file to exist.

> DO NOT check the `account.json` file into source-control (it’s already in the
> project's `.gitignore` file to help).

![create_service_account_user.png][2]

![create_service_account_key.png][3]

[1]: https://console.cloud.google.com/apis/credentials/serviceaccountkey
[2]: ../images/create_service_account_user.png
[3]: ../images/create_service_account_key.png
