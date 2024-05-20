resource "aws_security_group" "scg-node-group" {
    name = var.name-scg-node-group
    description = var.name-scg-node-group
    vpc_id = var.id-vpc

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        description = "self"
        self = "true"
    }
    
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        description = "From EKS cluster Security"
        security_groups = [var.cluster-security-group-id]
    }

    egress {
        description = "Outbound ALL"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}