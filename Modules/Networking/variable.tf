variable "vpc_cidr"  {
type = string 
description = "cidr_block for eks-vpc"
}

variable  "eks-pubcidr_block" {
type = list(string)
description = "cidr_block for eks-vpc"
default = [ "10.0.1.0/24" , "10.0.2.0/24" ]
}

variable "eks-privcidr_block" {
type = list(string)
description = "cidr_block for eks-vpc"
default = [ "10.0.100.0/24" , "10.0.200.0/24" ]

}


