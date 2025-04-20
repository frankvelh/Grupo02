terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}
#Image01
resource "docker_image" "nginx01" {
  name         = "nginx"
  keep_locally = false
}

#Imagen02
resource "docker_image" "nginx02" {
  name         = "nginx:latest"
  keep_locally = false
}

#Contenedor 1
resource "docker_container" "nginx_conteiner_01" {
  image = docker_image.nginx01.image_id
  name  = "Imagen01"

  ports {
    internal = 80
    external = 8002
  }
}
resource "docker_container" "nginx_conteiner_02" {
  image = docker_image.nginx02.image_id
  name  = "Imagen02"

  ports {
    internal = 80
    external = 8004
  }
   depends_on = [docker_image.nginx01]
}