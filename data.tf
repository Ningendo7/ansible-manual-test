#data for amazon linux AMI

data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
  provider = aws.us_east_2
}
# ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04*"]
  }
  owners = ["099720109477"] # Canonical account ID
  provider = aws.us_west_1
}

# dabian AMI
data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-*-amd64-*"]
  }
  owners = ["136693071363"] # Debian account ID
  provider = aws.us_west_2
}