variable "cidr_block" {
    type = string
    description = "cidr for customer VPC"
}

variable "public_subnets_cidr" {
   type = list
   description = "cidr range of public subnet"
 }

variable "availability_zones" {
    type = list
    description = "list of availability zone in provided reqion"
 }

variable "private_subnets_cidr" {
    type = list
    description = "list of private subnets"    
 }
