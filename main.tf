resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = var.network_auto_create_subnetworks
  description             = var.network_description
  routing_mode            = var.network_routing_mode
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  # Create one subnet for each region
  for_each = var.subnetworks
  name     = each.value.name

  ip_cidr_range = each.value.ip_cidr_range

  dynamic "secondary_ip_range" {
    for_each = lookup(each.value, "secondary_ip_range", [])
    content {
      range_name    = lookup(secondary_ip_range.value, "range_name", null)
      ip_cidr_range = lookup(secondary_ip_range.value, "ip_cidr_range", null)
    }
  }

  network = google_compute_network.vpc_network.self_link
  region  = each.value.region
}
