# Data source 
#####
data "terraform_remote_state" "test" {
  backend = "s3"
  config = {
    bucket = "test-terraform-state"
    key    = "test/terraform.tfstate"
    region = "eu-west-1"
  }
}

