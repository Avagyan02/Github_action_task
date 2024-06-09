resource "aws_instance" "main" {
  ami = var.ec2_ami

  # key_name               = var.ec2_key_name
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  # vpc_security_group_ids = [aws_security_group.my_sg.id]

    user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y git
    git clone https://github.com/Avagyan02/mini-shop.git /opt/mini-shop
    cd /opt/mini-shop
    npm install
    npm start
    EOF

  tags = {
    By        = var.ec2_name
    Terraform = true
  }
}