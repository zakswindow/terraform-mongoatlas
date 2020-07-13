# Configure the MongoDB Atlas Provider
provider "mongodbatlas" {
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
  alias       = "mongo"
  version     = "~> 0.6"
}

provider "aws" {
  region = var.region
}

provider "aws" {
  region  = var.region
  alias   = "dev"
  version = "~> 2.41"

  assume_role {
    role_arn     = "arn:aws:iam::${var.DevAccountID}:role/OrganizationAccountAccessRole"
    session_name = "Dev"
  }
}
