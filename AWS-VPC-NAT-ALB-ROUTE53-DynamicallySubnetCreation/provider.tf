#AWS provider configuration
provider "aws" {
  region = "us-west-2"

  assume_role {
    role_arn     = "arn:aws:iam::151643461848:role/TerraformRuntimeRole"
    session_name = "test"
  }
}
