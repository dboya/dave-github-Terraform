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
  token = "Zp22WKnZ3uQ"
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
