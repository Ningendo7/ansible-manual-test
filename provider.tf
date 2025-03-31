terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    
    }
  }
}


# Providers for different regions
provider "aws" {
  region = "us-east-2"
  alias  = "us_east_2"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us_west_2"
}

provider "aws" {
  region = "us-west-1"
  alias  = "us_west_1"
}