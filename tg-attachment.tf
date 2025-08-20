/*
resource "aws_lb_target_group_attachment" "ec2_attach1" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.my_ec2.id
  port             = 80
}
*/