provider "google" {
  credentials = "${file("../../config/account.json")}"
  project     = "${var.gcloud_project}"
  region      = "${var.gcloud_region}"
}

/* *********************************************************************
** NETWORK
********************************************************************* */

resource "google_compute_network" "platform_name" {
  name    = "${var.platform_name}-net"
}

resource "google_compute_firewall" "http" {
  name    = "${var.platform_name}-firewall-http"
  network = "${google_compute_network.platform_name.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

   source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_subnetwork" "platform_name" {
  name          = "${var.platform_name}-${var.gcloud_region}-subnet"
  ip_cidr_range = "10.1.2.0/24"
  network       = "${google_compute_network.platform_name.self_link}"
  region        = "${var.gcloud_region}"
}

resource "google_compute_global_address" "platform_name" {
  name = "${var.platform_name}-address"
}

/* *********************************************************************
** CLUSTER
********************************************************************* */

resource "google_container_cluster" "platform_name" {
  name = "${var.platform_name}-cluster"
  network = "${google_compute_network.platform_name.name}"
  subnetwork = "${google_compute_subnetwork.platform_name.name}"
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

output "client_certificate" {
  value = "${google_container_cluster.platform_name.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.platform_name.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.platform_name.master_auth.0.cluster_ca_certificate}"
}

output "public_ip_address" {
  value = "${google_compute_global_address.platform_name.address}"
}
