data "google_compute_image" "vm_image" {
  family  = "debian-12"
  project = "debian-cloud"
}


resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = data.google_compute_image.vm_image.self_link
    }
  }

  network_interface {
    network = var.vpc_name

    access_config {
    # this creates a automatically assigned external IP
    }
  }

}