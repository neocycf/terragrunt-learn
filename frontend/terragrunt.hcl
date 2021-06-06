# source = "${find_in_parent_folders()}/modules/ec2", will fail - "stat /home/daniel/Dev/terraform/stage2/terragrunt.hcl/modules: not a directory" 
# all source methods below work. Remember to delete terragrunt-cache, .terraform.lock.hcl first. 
# https://ftclausen.github.io/dev/infra/terraform-solving-the-double-slash-mystery/
terraform {
  source = "${find_in_parent_folders()}/..//modules/ec2"
  #source = "${find_in_parent_folders()}/../modules//ec2"
  #source = "..//modules/ec2"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  ami = "ami-0ca38c7440de1749a"
}
