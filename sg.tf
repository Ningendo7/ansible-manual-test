# create default vpc in all regions if one does not exit
resource "aws_default_vpc" "default_vpc_east2" {
         provider = aws.us_east_2
}
resource "aws_default_vpc" "default_vpc_west1" {
  provider = aws.us_west_1
}
resource "aws_default_vpc" "default_vpc_west2" {
  provider = aws.us_west_2
}

# Create Web Security Group for us-east-2
resource "aws_security_group" "web-sg_east2" {
         provider = aws.us_east_2
  name        = "ansible-Web-SG"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_default_vpc.default_vpc_east2.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-east2-name
  }
}

# Create Web Security Group for us-west1
resource "aws_security_group" "web-sg_west1" {
         provider = aws.us_west_1
  name        = "ansible-Web-SG"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_default_vpc.default_vpc_west1.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-west1-name
  }
}

# Create Web Security Group for us-east-2
resource "aws_security_group" "web-sg_west2" {
         provider = aws.us_west_2
  name        = "ansible-Web-SG"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_default_vpc.default_vpc_west2.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-west2-name
  }
}


