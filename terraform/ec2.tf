provider "aws" {
  region     = "us-east-1"
}

resource "aws_key_pair" "kp" {
  key_name = "flask-kp"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDital09K3OenOudHdYHmJWtaXFijnbky1LF2CD4uV0oY9cnuRRhlWv4ZUOl4aQQgFG8ys5Il4tEA1rTOLMikZOf2UJ9wHPRWNuLGl3ldYPIIogwWa3jT46M6+NAq6QJ2J5LR0yMcif4OnoVbdFs8TP+UJkcT9EcqLL8QUFl+qHvzbJgPnTZDTAbs9LvAeTFXJOpvYYuAmREVlr0WwBG8Oe36J2CL+Nd3GRtf77qksBNnLXtn3f+FR7nGXe+rTDusfl3XsPwqnLT5s7EyxH59FL3isehrjomt4K1UTBxg8sWtw2cGMsrDTHs86LKpTLz7kGm5SA2LZcoO2/AqyLNTfdgCstIiHSUkmF70lB0wR1YR8vKgZ7x8ZYxFXEbbsVFaabF9l9x+xhvmN3EmodR7OC2qx6tNSBMHxQLRattUCBZqvQYiipsORliiuN22sMxm/MmhDYytXPUsohX/+4Bb/KvUYe8aEOw2SmJ0JJ4t7WAS40guFReCMBNhZMxKvBa4wBmMpW/eD1g+8nwioxRhzhUNNHhxqA37Z5GaPND60Q9DkXiVSSzdL/2ZFZfpiMxVFDfln55n+HeUEVVwtpVo6SFF5ikXtim7ZUnnYXkUKEH/pxTAYvaeSocBVqlisxHOx5nq1ervwojpdNen3PDRVD8JuGQjhxFMkA5gP5hU6YvQ== cmlin@cmlin-Z370N-WIFI"
}

resource "aws_security_group" "allow_ssh" {
  name     = "allow_ssh"

  ingress {
    description = "allow inbound ssh traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "example" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  key_name = "flask-kp"
  tags = {
      Name = "Flask-Api"
  }
  security_groups = ["allow_ssh"]
}

# output "public_ip" {
#   value = aws_eip.example.public_ip
# }