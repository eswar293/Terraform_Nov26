
variable "subnet2_cidr" {
    description = "Dev_subnet2 cidr clock"
}

variable "subnet1_cidr" {
    description = "Dev_subnet1 cidr block" 
}

variable "Dev_vpc" {
    description = "Dev_vpc cidr block"
}

variable "environment" {
    description = "Specify the environment"
}

data "aws_vpc" "default_vpc" {
    default = true
}

output "default_subnet" {
    value = data.aws_vpc.default_vpc.id
}


resource "aws_vpc" "Dev_vpc" {
    cidr_block = var.Dev_vpc

    tags = {
        Name = "Dev_VPC"
    }
}

output "vpc_id" {
    value = aws_vpc.Dev_vpc.id
}

resource "aws_subnet" "Dev_subnet1" {
    vpc_id = aws_vpc.Dev_vpc.id
    cidr_block = var.subnet1_cidr
    availability_zone = "ap-south-1c"

    tags = {
        Name = "Dev_Subnet1"
        Environment = var.environment
    }
}

output "Subnet_id1" {
    value = aws_subnet.Dev_subnet1.id
}

resource "aws_subnet" "Dev_subnet2" {
    vpc_id = aws_vpc.Dev_vpc.id
    cidr_block = var.subnet2_cidr
    availability_zone = "ap-south-1a"

    tags = {
        Name = "Dev_Subnet2"
        Environment = var.environment
    }
}

output "Subnet_id2" {
    value = aws_subnet.Dev_subnet2.id
}