## Prepare

First of all make sure you're in the right directory:

```sh
cd example1-single-docker-gcloud
```

## Setup

Switch to your GCP project (using its ID) and pick a zone:

```sh
gcloud config set project playground-195011
gcloud config set compute/zone us-west1-b
```

## Hello world deployment

```sh
gcloud compute firewall-rules create allow-http --allow tcp:80 --target-tags http-server
gcloud beta compute instances create-with-container nginx-docker --machine-type g1-small --tags http-server --container-image docker.io/nginxdemos/hello
```

You should see some output similar to this:

```
Creating firewall.../Created [https://www.googleapis.com/compute/v1/projects/playground-195011/global/firewalls/allow-http].
Creating firewall...done.
NAME        NETWORK  DIRECTION  PRIORITY  ALLOW   DENY
allow-http  default  INGRESS    1000      tcp:80

...

API [compute.googleapis.com] not enabled on project [123412341234].
Would you like to enable and retry?  (Y/n)?  y

Enabling service compute.googleapis.com on project 123412341234...
Waiting for async operation operations/tmo-acf.fdd413b0-83f5-4f5b-afc4-b0161672829d to complete...
Operation finished successfully. The following command can describe the Operation details:
 gcloud service-management operations describe operations/tmo-acf.fdd413b0-83f5-4f5b-afc4-b0161672829d
Created [https://www.googleapis.com/compute/beta/projects/playground-195011/zones/us-west1-b/instances/nginx-docker].
NAME          ZONE        MACHINE_TYPE  PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP  STATUS
nginx-docker  us-west1-b  g1-small                   10.138.0.2   35.230.5.84  RUNNING
```

Now you can open the `EXTERNAL_IP` from your output in a browser window and you
should see the NGINX "Hello World" page.

Once you're finished basking in the glory of your first deployment, let's delete
it and move on 😺

```sh
gcloud compute instances delete nginx-docker
```

You should see some output similar to this:

```
The following instances will be deleted. Any attached disks configured
 to be auto-deleted will be deleted unless they are attached to any
other instances or the `--keep-disks` flag is given and specifies them
 for keeping. Deleting a disk is irreversible and any data on the disk
 will be lost.
 - [nginx-vm] in [us-west1-b]

Do you want to continue (Y/n)?  y

Deleted [https://www.googleapis.com/compute/v1/projects/playground-195011/zones/us-west1-b/instances/nginx-docker].
```

## App deployment

First make sure you have a fresh build (see above).

Then tag it and push it to GCP Container Registry:

TODO

Then you're ready to update the container in the VM:

TODO

## Further reading

For more info on deploying containers on GCP see:
https://cloud.google.com/compute/docs/containers/deploying-containers

Reference for the `create-with-container` command:
https://cloud.google.com/sdk/gcloud/reference/beta/compute/instances/create-with-container
