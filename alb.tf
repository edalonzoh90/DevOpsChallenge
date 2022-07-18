resource "aws-alb" "my-alb"{
  name = "my-alb"
  subnets = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  security_groups = [aws_security_group.alb-securitygroup.id]
}