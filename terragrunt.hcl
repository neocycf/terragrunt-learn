# stage/terragrunt.hcl
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "toninho-tf"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-northeast-1"
    #encrypt        = true
    #dynamodb_table = "my-lock-table"
  }
}
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"

}
EOF
}
