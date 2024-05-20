module "goyo-eks" {
    source = "./module/eks-control-plane"
    name-cluster = "literary-goyo-eks"
    control-plane-k8s-version = "1.29"
    version-vpc-cni-addon = "v1.16.0-eksbuild.1"
    version-kube-proxy-addon = "v1.29.0-eksbuild.1"
    version-coredns = "v1.11.1-eksbuild.4"
    id-subnet-1 = data.terraform_remote_state.vpc.outputs.private_subnets[0]
    id-subnet-2 = data.terraform_remote_state.vpc.outputs.private_subnets[1]

    service-ipv4-cidr = "192.168.0.0/16"
    allow-endpoint-public-access = true

    tags-control-plane = merge ( 
        data.aws_default_tags.aws_dt.tags,
        { Create = "20240518" }
    )

    name-role-eks-controlplane = "role-goyo-eks"
    name-role-ekssa-aws-node = "role-ekssa-goyo-eks-aws-node"
    name-role-ekssa-aws-load-balancer-controller = "role-ekssa-goyo-eks-aws-load-balancer-controller"
}

output "cluster-endpoint" {
    value = module.goyo-eks.cluster-endpoint
}

output "certificate-authority-data" {
    value = module.goyo-eks.cluster-ca-data
}

output "cluster-security-group-id" {
    value = module.goyo-eks.cluster-security-group-id
}