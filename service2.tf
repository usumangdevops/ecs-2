resource "aws_ecs_service" "omero-redis" {
  	name            = "omero-redis"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.ecs-ls-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.omero-redis.arn}"
  	desired_count   = 1

  	load_balancer {
    	target_group_arn  = "${aws_alb_target_group.ecs-target-group.arn}"
    	container_port    = 6379
    	container_name    = "omero-redis"
	}
}
