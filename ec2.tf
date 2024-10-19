resource "aws_security_group" "instance_sg" {# Security Group for EC2
  name        = "instance_sg"
  description = "Allow inbound traffic for HTTP and SSH"
  vpc_id      = var.vpc_id  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_instance" {
  ami                    = "ami-0c55b159cbfafe1f0" # EC2 Instance
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "SpringBootAppInstance"
  }
}
