variable "AWS_REGION" {
 default = "us-east-1"
}
variable "AWS_PROFILE" {
 default = "eks-demo"
}


variable "cluster_name" {
 default = "eks-demo-cluster"
 type = string
}

# Global var file.
variable "default_tags" {
 type = map
 description = "Tags used to identify the project and environment"
 default = {}
}

