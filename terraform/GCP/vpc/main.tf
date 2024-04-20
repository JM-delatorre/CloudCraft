resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}

# resource "google_compute_subnetwork" "vpc_subnet" {
#   name          = var.subnet-name
#   ip_cidr_range = var.subnet-ip-range
#   network       = google_compute_network.vpc_network.self_link
# }

resource "google_compute_firewall" "vpc_firewall" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = [
      "25565", # Minecraft port
    ]
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}