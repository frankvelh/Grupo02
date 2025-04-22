terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" # poveedor de Docker para terraform
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}
#Contenedor01
resource "docker_container" "container_servidor_web01" {
  name         = "servidor_web01${terraform.workspace}"
  image = "nginx:latest"
   ports {
    external = var.web_server_port01[terraform.workspace]
    internal = 80
   }
}


#Contenedor02
#resource "docker_container" "container_servidor_web02" {
 # name         = "servidor_web02"
 # image = "nginx:latest"
  # ports {
  #  external = var.web_server_port02[terraform.workspace]
   # internal = 80
    
#}
#}