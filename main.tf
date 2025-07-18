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
  region = "eu-central-1"  # sau regiunea ta
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "devops-infra-app-bucket-${random_id.bucket_id.hex}"
  # Implicit private ACL
}

resource "aws_security_group" "my_sg" {
  name        = "elastic-ip-sg"
  description = "Allow SSH from my IP only"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["188.26.8.11/32"]  # pune IP-ul tău real aici
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = "ami-02003f9f0fde924ea"
  instance_type          = "t2.micro"
  key_name               = "alex.aws"
  vpc_security_group_ids = [aws_security_group.my_sg.id]

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

resource "aws_eip" "app_eip" {
  domain = "vpc"
  tags = {
    Name = "DevOpsInfraAppElasticIP"
  }
}

resource "aws_eip_association" "app_eip_assoc" {
  instance_id   = aws_instance.app_server.id
  allocation_id = aws_eip.app_eip.allocation_id
}

