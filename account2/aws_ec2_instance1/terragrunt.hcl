# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::git@github.com:bryanlabs/tf-modules.git//aws_ec2_instance"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# Define modules that this module is dependent on
dependency "vpc" {
  config_path = "../vpc"

  # This is only used during plan commands
  mock_outputs = {
    vpc_id = "vpc-12345"
    private_subnets = ["subnet-1", "subnet-2"]
  }
}

# Define modules that this module is dependent on
dependency "vpc" {
  config_path = "../vpc"

  # This is only used during plan commands
  mock_outputs = {
    vpc_id = "vpc-12345"
    private_subnets = ["subnet-1", "subnet-2"]
  }
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name = "dev-dan"
  ec2_key_name            = "altitude.cloud"
  subnet_id               = dependency.vpc.outputs.private_subnets[0]
}