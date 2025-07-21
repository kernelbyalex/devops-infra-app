terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "devops-infra-app-bucket-${random_id.bucket_id.hex}"
  # implicit private ACL
}

resource "aws_security_group" "app_sg" {
  name        = "app-server-sg"
  description = "Allow SSH only from Bastion Host"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]  # doar bastion poate SSH
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # deschidem portul 3000 public pentru aplicație
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = "ami-02003f9f0fde924ea" # Ubuntu 22.04 eu-central-1
  instance_type          = "t2.micro"
  key_name               = "alex.aws"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo docker run -d -p 3000:3000 your-dockerhub-username/devops-app:latest
              EOF

  tags = {
    Name = "DevOpsInfraAppServer"
  }
}
