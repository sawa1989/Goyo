### IAM ROLE for VPC CNI #### 

resource "aws_iam_role" "role-ekssa-aws-node" {
    assume_role_policy = data.aws_iam_policy_document.policy-ekssa-aws-node.json
    name = var.name-role-ekssa-aws-node
}

data "aws_iam_policy_document" "policy-ekssa-aws-node" {
    statement {
      actions = ["sts:AssumeRoleWithWebIdentity"]
      effect = "Allow"

      condition {
        test = "StringEquals"
        variable = "${replace(aws_iam_openid_connect_provider.oidc.url, "https://", "")}:sub"
        values = ["system:serviceaccount:kube-system:aws-node"]
      }
      
      principals {
        identifiers = [aws_iam_openid_connect_provider.oidc.arn]
        type="Federated"
      }
    }
}

resource "aws_iam_role_policy_attachment" "role-eks-aws-node-policya-1" {
    role = aws_iam_role.role-ekssa-aws-node.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}


