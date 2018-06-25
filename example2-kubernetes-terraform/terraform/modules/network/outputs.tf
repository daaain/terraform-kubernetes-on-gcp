output "network_name" {
  value = "${google_compute_network.platform_name.name}"
}

output "subnetwork_name" {
  value = "${google_compute_subnetwork.platform_name.name}"
}

output "public_ip_address" {
  value = "${google_compute_global_address.platform_name.address}"
}