provider "tls" {}

##Creates ec2_key in us-east-2
# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "east2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Key Pair for AWS us-east-2 region
resource "aws_key_pair" "east2public_key" {
  provider   = aws.us_east_2
  key_name   = var.keypair1-name
  public_key = tls_private_key.east2_key.public_key_openssh
}

# Save file for the private key locally
resource "local_file" "ssh_key_east2" {
  filename     = "${var.keypair1-name}.pem"
  content      = tls_private_key.east2_key.private_key_pem
  file_permission = "400"
}

##Creates ec2_key pair in us-west-1
# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "west1_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Key Pair for AWS us-west-1 region
resource "aws_key_pair" "west1public_key" {
  provider   = aws.us_west_1
  key_name   = var.keypair2-name
  public_key = tls_private_key.west1_key.public_key_openssh
}

# Save file for the private key locally
resource "local_file" "ssh_key_west1" {
  filename     = "${var.keypair2-name}.pem"
  content      = tls_private_key.west1_key.private_key_pem
  file_permission = "400"
}

##Creates ec2_keypair in us-west-2
# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "west2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Key Pair for AWS us-west-2 region
resource "aws_key_pair" "west2public_key" {
  provider   = aws.us_west_2
  key_name   = var.keypair3-name
  public_key = tls_private_key.west2_key.public_key_openssh
}

# Save file for the private key locally
resource "local_file" "ssh_key_west2" {
  filename     = "${var.keypair3-name}.pem"
  content      = tls_private_key.west2_key.private_key_pem
  file_permission = "400"
}