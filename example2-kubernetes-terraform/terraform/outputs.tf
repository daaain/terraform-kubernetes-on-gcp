output "client_certificate" {
  value = "${module.cluster.client_certificate}"
}

output "client_key" {
  value = "${module.cluster.client_key}"
}

output "cluster_ca_certificate" {
  value = "${module.cluster.cluster_ca_certificate}"
}

output "public_loadbalancer_ip_address_value" {
  value = "${module.network.public_ip_address}"
}
