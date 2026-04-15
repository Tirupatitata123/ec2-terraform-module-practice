provider "aws"{
    region = "ap-south-1"
}

resource "aws_instance" "myvm" {
 ami = var.ami_value
 instance_type =var.ec2_type
 key_name=var.key
 tags = {
    Name = var.tag_value
 }
}