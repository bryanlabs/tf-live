terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "dev"
  cidr = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.254.0/24", "10.0.255.0/24"]
  public_subnet_suffix = "public"
  private_subnet_suffix = "private"
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dhcp_options = true
  dhcp_options_domain_name = "dev.net"
  dhcp_options_domain_name_servers = ["127.0.0.1", "10.0.0.2"]
  tags = {
    Environment = "dev"
  }
}