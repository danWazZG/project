provider "aws" {
region = var.region
}

resource "aws_instance" "app" {
ami = var.ami_id
instance_type = "t2.micro"
key_name      = "klucze"
tags = {
Name = "PythonAppInstance"
}

 provisioner "remote-exec" {
 inline = [
 "docker run -d -p 80:80 python-app"
 ]
 connection {
            type        = "ssh"
            user        = "ec2-user" # lub ubuntu, w zależności od używanej AMI
            private_key = file("~/.ssh/private.key") # Zmień ścieżkę na właściwy klucz prywatny
            host        = self.public_ip
        }
 }
}

variable "region" {
default = "us-east-1"
}

variable "ami_id" {
default = "ami-0c02fb55956c7d316" # AMI z Linux
}
