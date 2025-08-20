variable "aws_region" {
  description = "AWS region to launch resources"
  type        = string
  default     = "ap-south-1"
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0861f4e788f5069dd" # Amazon Linux 2 for ap-south-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "madhava"
}

# variable "root_volume_size" {
#  description = "Root volume size in GB"
#  type        = number
 #default     = 8
#} 