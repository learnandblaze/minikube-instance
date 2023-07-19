

resource "aws_instance" "ec2" {
  ami               = "${lookup(var.AMIS,var.AWS_REGION)}"
  instance_type     = var.ec2.instance_type
  
 # os_type           = var.ec2.os_type
 # vpc_id            = data.aws_vpc.vpc.id
 # count             = var.instance_count
  associate_public_ip_address = true
    root_block_device {
    delete_on_termination = true 
    encrypted             = false
    volume_size           = var.ec2.volume_size
    volume_type           = var.ec2.volume_type
  
 }

  # the VPC 
  # vpc_id = data.aws_vpc.vpc.id
  # the subnet id
  subnet_id = data.aws_subnet.snet.id

  # the security group

  vpc_security_group_ids = [aws_security_group.secgrp.id]

  # the public SSH key
  key_name = aws_key_pair.keystodeploy.key_name

 # user_data = file("bootstrap.sh")
   user_data = file("${path.module}/bootstrap.sh")

  tags = {
    Name = "mini2play"
  }

}


