
resource "aws_key_pair" "keystodeploy" {
  key_name   = "keystodeploy-3"
  public_key = file ("~/.ssh/id_rsa_awscloudkey.pub")
}
