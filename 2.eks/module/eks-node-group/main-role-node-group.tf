resource "aws_iam_role" "role-node-group" {
    name = var.name-role-node-group

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
            Service = "ec2.amazonaws.com"
            }
        },
        ]
    }) 
}

### Policy Attachment to Role ### 
resource "aws_iam_role_policy_attachment" "role-node-group-policya-1" {
    role = aws_iam_role.role-node-group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "role-node-group-policya-2" {
    role = aws_iam_role.role-node-group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}