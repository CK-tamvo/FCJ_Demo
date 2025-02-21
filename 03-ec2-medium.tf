# resource "aws_instance" "medium_ec2" {

#   ami                         = var.ec2_ami
#   instance_type               = "t2.medium"
#   monitoring                  = true
#   subnet_id                   = values(aws_subnet.public_subnets)[0].id
#   vpc_security_group_ids      = [aws_security_group.security_group.id]
#   associate_public_ip_address = true

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name        = "EC2 medium Server"
#   }

#   root_block_device {
#     volume_size = 30
#   }
# }