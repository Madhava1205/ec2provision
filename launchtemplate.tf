resource "aws_launch_template" "my_lt" {
  name_prefix   = "my-launch-template"
  image_id      = "ami-0861f4e788f5069dd" # change to your AMI
  instance_type = "t3.micro"
  key_name      = "linux" # replace with your key

  network_interfaces {
    security_groups             = [aws_security_group.madhava_dotnet_sg.id]
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG-Instance"
    }
  } 

  user_data = base64encode(<<-EOT
              #!/bin/bash
              yum update -y
              yum install -y httpd
              # Download index.html from S3 to web root
              curl -o /var/www/html/index.html https://tfstate-backend-bucket-1205.s3.ap-south-1.amazonaws.com/index.html
              systemctl start httpd
              systemctl enable httpd
              EOT
  )
}