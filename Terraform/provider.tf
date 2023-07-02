terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region  = var.AWS_REGION
  profile = var.AWS_PROFILE
}

data "aws_eks_cluster_auth" "eks-demo-cluster-auth" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks-demo-cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks-demo-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks-demo-cluster-auth.token
}
