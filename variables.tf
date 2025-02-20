# VPC variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "FCJ-VPC"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "ec2_ami" {
  description = "AMI ID for EC2"
  type        = string
  default     = "ami-0195204d5dce06d99" // AMZ Linux 2 by default
}
