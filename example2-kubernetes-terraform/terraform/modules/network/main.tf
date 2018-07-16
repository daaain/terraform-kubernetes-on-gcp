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