variable "AWS_REGION" {
  default = "us-west-2"
}
variable "AMIS" {
  type = map(string)
  default = {
#    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-03f65b8614a860c29"
#    eu-west-1 = "ami-844e0bf7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "id_rsa_awscloud"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "id_rsa_awscloud.pub"
}



variable "ec2" {
  description = "The attribute of EC2 information"
  type = object({
    name              = string
    os_type           = string
    instance_type     = string
    volume_size       = number
    volume_type       = string
    availability_zone = string
  })

   default = {
    name              = "devkube"
    os_type           = "linux"
    instance_type     = "t2.xlarge"
    volume_size       = 20
    volume_type       = "gp3"
    availability_zone = "us-west-2b"
  }
}
