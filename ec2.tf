resource "aws_instance" "my_ec2" {
  ami           = var.ec2_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.madhava_dotnet_sg.id]
  subnet_id = aws_subnet.public_subnet.id
disable_api_termination = false   # 🔹 Enables termination protection
user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd              
              EOF
  tags = {
    Name = var.instance_name
  }
}
