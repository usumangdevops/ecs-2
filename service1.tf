resource "aws_ecs_service" "hedwig-omero-web" {
  	name            = "hedwig-omero-web"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.ecs-ls-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.hedwig-omero-web.arn}"
  	desired_count   = 1

  	load_balancer {
    	target_group_arn  = "${aws_alb_target_group.ecs-target-group.arn}"
    	container_port    = 8000
    	container_name    = "hedwig-omero-web"
	}
}
