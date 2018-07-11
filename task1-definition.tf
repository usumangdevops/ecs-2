data"aws_ecs_container_definition" "hedwig-omero-web" {
 task_definition = "${data.aws_ecs_task_definition.hedwig-omero-web.id}"
 container_name  = "hedwig-omero-web"
}
data"docker_registry_image" "labshare" {
 name = "labshare/hedwig-omero-web:v2018.0215.1"
}

resource "docker_image" "labshare" {
 name          = "${data.docker_registry_image.labshare.name}"
 pull_triggers = ["${data.docker_registry_image.labshare.sha256_digest}"]
}

data "aws_ecs_task_definition" "hedwig-omero-web" {
  task_definition = "${aws_ecs_task_definition.hedwig-omero-web.family}"
}

resource "aws_ecs_task_definition" "hedwig-omero-web" {
    family                = "hedwig-omero-web"
    container_definitions = "${file("app.json")}"

}
