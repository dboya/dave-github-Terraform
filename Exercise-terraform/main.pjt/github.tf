terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
  }
}

provider "github" {
  # Configuration options
  token = "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"
}


resource "github_repository" "terraform-example" {
  name        = "terraform-example"
  description = "My awesome web page"

  pages {
    source {
      branch = "master"
      path   = "/docs"
    }
  }
}
