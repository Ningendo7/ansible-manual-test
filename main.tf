resource "aws_instance" "master" {
  instance_type = "t2.small"
  ami = data.aws_ami.amazon-2.id
  provider = aws.us_east_2
  user_data = file("install.sh")
  key_name = aws_key_pair.east2public_key.key_name
  vpc_security_group_ids = [aws_security_group.web-sg_east2.id]
}

resource "aws_instance" "node1" {
         instance_type = "t2.small"
         ami = data.aws_ami.ubuntu.id
         provider = aws.us_west_1
         key_name = aws_key_pair.west1public_key.key_name
         vpc_security_group_ids = [aws_security_group.web-sg_east2.id]
}

resource "aws_instance" "node2" {
         instance_type = "t2.small"
         ami = data.aws_ami.debian.id
         provider = aws.us_west_2
         key_name = aws_key_pair.west2public_key.key_name
         vpc_security_group_ids = [aws_security_group.web-sg_west2.id]
}

  

# here we are using the Null resource to copy our ssh key into the master server.
resource "null_resource" "copy_ssh_key" {
  depends_on = [aws_instance.master]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key =  tls_private_key.east2_key.private_key_pem
    host        = aws_instance.master.public_ip
  }

  provisioner "file" {
    source      = "keypair1-name.pem"
    destination = "/home/ec2-user/keypair1-name.pem"
  }

  provisioner "file" {
    source      = "keypair2-name.pem"
    destination = "/home/ec2-user/keypair2-name.pem"
  }

  provisioner "file" {
    source      = "keypair3-name.pem"
    destination = "/home/ec2-user/keypair3-name.pem"
  }
   provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ec2-user/${var.keypair1-name}.pem",
      "chmod 400 /home/ec2-user/${var.keypair2-name}.pem",
      "chmod 400 /home/ec2-user/${var.keypair3-name}.pem",
      "sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config",
      "sudo systemctl restart sshd",
      "sudo useradd ansible",
      "echo 'ansible:ansible' | sudo chpasswd",
      "sudo cp /home/ec2-user/${var.keypair1-name}.pem /home/ansible/${var.keypair1-name}.pem",
      "sudo cp /home/ec2-user/${var.keypair2-name}.pem /home/ansible/${var.keypair2-name}.pem",
      "sudo cp /home/ec2-user/${var.keypair3-name}.pem /home/ansible/${var.keypair3-name}.pem",
      "sudo chmod 400 /home/ansible/${var.keypair1-name}.pem",
      "sudo chmod 400 /home/ansible/${var.keypair2-name}.pem",
      "sudo chmod 400 /home/ansible/${var.keypair3-name}.pem",
      "sudo chown ansible:ansible /home/ansible/${var.keypair1-name}.pem",
      "sudo chown ansible:ansible /home/ansible/${var.keypair2-name}.pem",
      "sudo chown ansible:ansible /home/ansible/${var.keypair3-name}.pem",

    ]
   }
}

