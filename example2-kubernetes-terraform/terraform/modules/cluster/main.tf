resource "google_container_cluster" "platform_name" {
  name = "${var.platform_name}-cluster"
  network = "${var.network_name}"
  subnetwork = "${var.subnetwork_name}"
  zone = "${var.gcloud_zone}"

  initial_node_count = "${var.cluster_node_initial_count}"

  master_auth {
    username = "${var.cluster_master_auth_username}"
    password = "${var.cluster_master_auth_password}"
  }

  node_config {
    machine_type = "${var.cluster_node_machine_type}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/projecthosting",
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
