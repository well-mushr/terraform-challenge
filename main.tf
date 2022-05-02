resource "google_storage_bucket" "auto-expire" {
  name          = var.name
  project       = var.project
  location      = "US"
  force_destroy = true

  storage_class = var.storage_class

  versioning {
    enabled = var.versioning
  }

  website {
    main_page_suffix = "index.html"
  }

  cors {
    origin          = "*"
    method          = "*"
    max_age_seconds = 3600
  }

  lifecycle_rule {
    condition {
      age = 3
    }

    action {
      type = "Delete"
    }
  }
}
