data "aws_ami" "worker_node" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon-eks-node-1.29-v*"]
  }
}

module "goyo-eks-ng" {
    source = "./module/eks-node-group"
    name-cluster = "literary-goyo-eks"
    name-node-group = "literary-goyo-eks-ng"

    cluster-security-group-id = module.goyo-eks.cluster-security-group-id
    id-vpc = data.terraform_remote_state.vpc.outputs.vpc_id
    id-subnet-1 = data.terraform_remote_state.vpc.outputs.private_subnets[0]
    id-subnet-2 =  data.terraform_remote_state.vpc.outputs.private_subnets[1]
    node-instance-type = ["t3.xlarge"]
    desired-node-size = 1
    min-node-size = 1
    max-node-size = 2
    node-capacity-type = "ON_DEMAND"
    name-role-node-group = "role-goyo-eks-ng"
    name-scg-node-group = "goyo-eks-nodegroup-sg"

    tags-node-group =  merge ( 
        data.aws_default_tags.aws_dt.tags,
        { Create = "20240518" }
    )
}