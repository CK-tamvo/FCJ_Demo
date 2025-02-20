terraform {  
  cloud {
    organization = "learn_pipeline"

    workspaces {
      name = "fcj_demo"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}