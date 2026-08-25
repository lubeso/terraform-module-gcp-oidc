terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.32.0, < 8.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.2, < 4.0.0"
    }
  }
}
