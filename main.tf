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

resource "aws_instance" "app_server" {
  ami           = "ami-02003f9f0fde924ea"
  instance_type = "t2.micro"
  key_name      = "alex.aws"

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

resource "aws_s3_bucket" "app_bucket" {
  bucket = "devops-infra-app-bucket-${random_id.bucket_id.hex}"
 #no acl
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

