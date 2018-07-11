resource "aws_security_group" "ecs-ls-securitygroup" {
  vpc_id = "${aws_vpc.main.id}"
  name = "ecs"
  description = "security group for ecs"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8000
      to_port = 8000
      protocol = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
     # security_groups = ["${aws_security_group.ecs-ls-alb.id}"]
  } 
  ingress {
      from_port = 80
      to_port = 80
      protocol = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  tags {
    Name = "ecs"
  }
}
