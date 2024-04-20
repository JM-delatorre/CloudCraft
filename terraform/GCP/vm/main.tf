data "google_compute_image" "vm_image" {
  family  = "debian-12"
  project = "debian-cloud"
}

resource "google_compute_disk" "boot_disk" {
  name = var.vm_name
  image = data.google_compute_image.vm_image.self_link
}

resource "google_compute_resource_policy" "policy" {
  name = "${var.vm_name}-schedule-resource-policy"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time = "04:00"
      }
    }

    retention_policy {
      max_retention_days = 3
    }
  }
}

resource "google_compute_disk_resource_policy_attachment" "attachment" {
  name = google_compute_resource_policy.policy.name
  disk = google_compute_disk.boot_disk.name
}


resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  allow_stopping_for_update = true
  boot_disk {
    auto_delete = false
    source = google_compute_disk.boot_disk.self_link 
  }

  network_interface {
    network = var.vpc_name

    access_config {
      nat_ip = var.external_ip
    }
  }

}