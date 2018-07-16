output "cluster_name" {
  value = "${google_container_cluster.platform_name.name}"
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
