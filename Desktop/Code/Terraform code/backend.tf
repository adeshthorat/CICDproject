terraform {
  backend "s3" {
    bucket = "terraform-user-statefile-artifacts"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}
