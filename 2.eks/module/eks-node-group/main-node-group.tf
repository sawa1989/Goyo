resource "aws_eks_node_group" "node_group" {
    cluster_name = var.name-cluster
    node_group_name = var.name-node-group
    node_role_arn = aws_iam_role.role-node-group.arn

    subnet_ids = [var.id-subnet-1, var.id-subnet-2]
    capacity_type = var.node-capacity-type
    instance_types = var.node-instance-type
    scaling_config {
        desired_size = var.desired-node-size
        max_size = var.max-node-size
        min_size = var.min-node-size
    }

    lifecycle {
      ignore_changes = [ scaling_config[0].desired_size,  scaling_config[0].min_size, scaling_config[0].max_size]
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.role-node-group-policya-1,
        aws_iam_role_policy_attachment.role-node-group-policya-2
     ]
}