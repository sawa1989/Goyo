### EKS IAM ROLE for cluster ### 
resource "aws_iam_role" "role-eks-controlplane" {
    name = var.name-role-eks-controlplane

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
            Service = "eks.amazonaws.com"
            }
        },
        ]
    })
}

### Policy Attachment to Role ### 
resource "aws_iam_role_policy_attachment" "role-eks-controlplane-policya-1" {
    role = aws_iam_role.role-eks-controlplane.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "role-eks-controlplane-policya-2" {
    role = aws_iam_role.role-eks-controlplane.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

