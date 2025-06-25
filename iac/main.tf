terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "static-s3-website" {
  source  = "spacelift.io/lunar-drift/static-s3-website/aws"
  version = "0.2.0"

  # Required inputs
  apex_domain = "cdmpw5k.com"
  use_www     = 1
  cloudfront = {
    cf_aliases                   = ["cdmpw5k.com", "www.cdmpw5k.com"]
    cf_geo_restriction_type      = "none"
    cf_geo_restriction_locations = []
  }
}