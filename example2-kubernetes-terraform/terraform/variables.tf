variable "gcloud_region" { default = "europe-west2" }
variable "gcloud_zone" { default = "europe-west2-b" }
variable "gcloud_project" { default = "playground-195011" }

variable "platform_name" { default = "terraform-playground" }

variable "cluster_master_auth_username" {}
variable "cluster_master_auth_password" {}
variable "cluster_node_machine_type" { default = "g1-small" }
variable "cluster_node_initial_count" { default = 2 }
