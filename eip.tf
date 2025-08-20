# Elastic IP
resource "aws_eip" "my_eip" {
  domain = "vpc"   # Required when using VPC
  instance = aws_instance.my_ec2.id   # Attach to EC2 instance

  tags = {
    Name = "my-eip"
  }
}
