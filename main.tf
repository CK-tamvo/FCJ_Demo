terraform {  
  cloud {
    organization = "fcj_demo_2025"

    workspaces {
      name = "fcj_demo"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}