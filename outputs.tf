output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "network_id" {
  value = google_compute_network.vpc_network.id
}

output "network_self_link" {
  value = google_compute_network.vpc_network.self_link
}

output "subnetwork_names" {
  value = { for p in sort(keys(var.subnetworks)) : p => google_compute_subnetwork.vpc_subnetwork[p].name }
}

output "subnetwork_self_links" {
  value = { for p in sort(keys(var.subnetworks)) : p => google_compute_subnetwork.vpc_subnetwork[p].self_link }
}

output "subnetwork_secondary_ip_ranges" {
  value = { for p in sort(keys(var.subnetworks)) : p => google_compute_subnetwork.vpc_subnetwork[p].secondary_ip_range }
}
