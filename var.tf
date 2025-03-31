

variable "keypair1-name" {
  description = "Ansible keypair in us-east-2"
  type = string
  default = "us-east-2"
}

variable "keypair2-name" {
         description = "ubuntu keypair in us-west-1"
         type = string
         default = "us-west-1"
  
}
variable "keypair3-name" {
         description = "debian keypair in us-west-2"
         type = string
         default = "us-west-2"
  
}
variable "sg-east2-name" {
  type = string
  default = "ansible-sg"
}
variable "sg-west1-name" {
  type = string
  default = "ubuntu-sg"
}
variable "sg-west2-name" {
  type = string
  default = "debian-sg"
}

