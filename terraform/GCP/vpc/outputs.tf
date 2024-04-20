output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "static_ip" {
  value = google_compute_address.static.address
}