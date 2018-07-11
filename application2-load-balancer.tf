
# Create a new load balancer
resource "aws_elb" "ecs-load-balancer" {
  name               = "ecs-load-balancer"
  security_groups     = ["${aws_security_group.ecs-ls-securitygroup.id}"]
 # availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
   subnets             = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]

 # access_logs {
 #   bucket        = "foo"
 #   bucket_prefix = "bar"
 #   interval      = 60
 # }

  listener {
    instance_port     = 6379
    instance_protocol = "TCP"
    lb_port           = 6379
    lb_protocol       = "TCP"
  }

  #listener {
  #  instance_port      = 8000
  #  instance_protocol  = "http"
  #  lb_port            = 443
  #  lb_protocol        = "https"
  #  ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  #}

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "TCP:6379"
    interval            = 30
  }

#  instances                   = ["${aws_instance.foo.id}"]
#  cross_zone_load_balancing   = true
#  idle_timeout                = 400
#  connection_draining         = true
#  connection_draining_timeout = 400

  tags {
    Name = "foobar-terraform-elb"
  }
}
