data "aws_default_tags" "aws_dt" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = "literary-goyo-vpc"
  cidr            = "10.10.0.0/18"
  azs             = ["ap-northeast-2a", "ap-northeast-2c"]
  private_subnets = ["10.10.0.0/21", "10.10.8.0/21"]
  public_subnets  = ["10.10.16.0/21", "10.10.24.0/21"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  tags = merge(
    data.aws_default_tags.aws_dt.tags,
    { Create = "20240518" }
  )
}
