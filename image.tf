resource "docker_image" "taskoverflow" {
  name = "${aws_ecr_repository.taskoverflow.repository_url}:latest"
  build {
    context = "."
    platform = "linux/amd64"
  }
  
  triggers = {
    dockerfile = filemd5("${path.module}/Dockerfile")
  }
}

resource "docker_registry_image" "taskoverflow" {
  name = docker_image.taskoverflow.name
}
