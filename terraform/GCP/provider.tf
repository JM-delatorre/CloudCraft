terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.21.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "cloudcraft-417903"
  region  = "us-east1"
  zone    = "us-east1-b"
}

