variable "name-cluster" {
    type= string
}

variable "control-plane-k8s-version" {
    type= string
}

variable "version-vpc-cni-addon" {
    type= string
}

variable "version-kube-proxy-addon" {
    type= string
}
variable "version-coredns" {
    type= string
}


variable "id-subnet-1" {
    type= string
}

variable "id-subnet-2" {
    type= string
}

variable "service-ipv4-cidr" {
    type= string
}

variable "tags-control-plane" {
    type= map(string)
}

variable "name-role-eks-controlplane" {
    type= string
}

variable "name-role-ekssa-aws-node" {
    type= string
}

variable "name-role-ekssa-aws-load-balancer-controller" {
    type= string
}

variable "allow-endpoint-public-access" {
    type= string
}