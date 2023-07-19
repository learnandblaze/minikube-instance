
resource "aws_security_group" "secgrp" {
    vpc_id          = data.aws_vpc.vpc.id
    name            = "ssh-3"
    description     = "inbound ssh"
    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    from_port       = 22 
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]

  }
  tags = {
    name = "inbound_ssh3"
  }

  ingress {
    from_port      = 443
    to_port        = 443
    protocol       = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
  }
  
  
}
