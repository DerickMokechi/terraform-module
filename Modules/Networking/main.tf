locals {
  vpc-name = "eks-vpc"
  igw-name = "eks-vpc-igw"
  pub-subnet-name = "eks-pubsubnet"
  priv-subnet-name = "eks-privsubnet"

}

#VPC for EKS Cluster

resource "aws_vpc" "eks-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = local.vpc-name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = local.igw-name
  }
}

# Public subnet for EKS Clster

resource "aws_subnet" "eks-pubsubnet" {
count = length(var.eks-pubcidr_block)
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = element(var.eks-pubcidr_block,count.index)

  tags = {
    Name = local.pub-subnet-name
  }
}

resource "aws_subnet" "eks-privsubnet" {

count = length(var.eks-privcidr_block)
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = element(var.eks-privcidr_block,count.index)

  tags = {
    Name = local.priv-subnet-name
  }
}