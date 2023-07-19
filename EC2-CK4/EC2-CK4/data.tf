# The existing virtual private cloud id 
data "aws_vpc" "vpc" {
 # id = "vpc-0be11647429b80294"
  id = "vpc-02739381afbb7d2cc"

}

# The existing subnet id 
data "aws_subnet" "snet" {
  # id = "subnet-001bca916710f44ae"  # ck-app-snet-1-Dev
  # id = "subnet-079c95eab87edf79c"  # ck-app-snet-2-Dev
  id = "subnet-096c56db0220623cd"    # ck-app-snet-3-Dev
}