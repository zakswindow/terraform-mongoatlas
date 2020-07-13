terraform {
  backend "s3" {
    bucket = "terraform-bucket"
    acl    = "bucket-owner-full-control"
    key    = "dev/mongodb/terraform.tfstate"
    region = "eu-west-1"
  }
}

