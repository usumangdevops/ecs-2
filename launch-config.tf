resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "ecs-launch-configuration"
    image_id                    = "${lookup(var.ECS_AMIS, var.AWS_REGION)}"
    instance_type               = "${var.ECS_INSTANCE_TYPE}"
    iam_instance_profile        = "${aws_iam_instance_profile.ecs-ec2-role.id}"

  #  root_block_device {
  #    volume_type = "standard"
  #    volume_size = 100
  #    delete_on_termination = true
  #  }

    lifecycle {
      create_before_destroy = true
    }

    security_groups             = ["${aws_security_group.ecs-ls-securitygroup.id}"]
    associate_public_ip_address = "true"
    key_name                    = "${aws_key_pair.mykeypair.key_name}"
#    user_data                   = <<EOF
                                #  !/bin/bash
                                #  echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
                                #  EOF
}
