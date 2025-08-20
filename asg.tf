resource "aws_autoscaling_group" "my_asg" {
  desired_capacity     = 1
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.public_subnet.id] # Add more subnet IDs if needed

  launch_template {
    id      = aws_launch_template.my_lt.id
    version = "$Latest"
  }

 target_group_arns = [aws_lb_target_group.app_tg.arn]

  tag {
    key                 = "Name"
    value               = "MyASG"
    propagate_at_launch = true
  }
}