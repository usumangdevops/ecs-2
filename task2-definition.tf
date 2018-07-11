#redis-task

data"aws_ecs_container_definition" "omero-redis" {
 task_definition = "${data.aws_ecs_task_definition.omero-redis.id}"
 container_name  = "omero-redis"
}
data"docker_registry_image" "sorgerlab" {
 name = "sorgerlab/omero-redis"
}

resource "docker_image" "sorgerlab" {
 name          = "${data.docker_registry_image.sorgerlab.name}"
 pull_triggers = ["${data.docker_registry_image.sorgerlab.sha256_digest}"]
}

data "aws_ecs_task_definition" "omero-redis" {
  task_definition = "${aws_ecs_task_definition.omero-redis.family}"
}

resource "aws_ecs_task_definition" "omero-redis" {
    family                = "omero-redis"
    container_definitions = "${file("app1.json")}"

}

