resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "ecs-autoscaling-group"
    max_size                    = 3
    min_size                    = 3
#    desired_capacity            = 
    vpc_zone_identifier         = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
    launch_configuration        = "${aws_launch_configuration.ecs-launch-configuration.name}"
    health_check_type           = "ALB"
  }
