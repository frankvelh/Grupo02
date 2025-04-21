terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
 # host    = "npipe:////.//pipe//docker_engine"
}
#Contenedor01
resource "docker_container" "container_servidor_web01" {
  name         = "servidor_web01"
  image = "nginx:latest"
   ports {
    external = var.web_server_port01
    internal = 80
   }
}

#Contenedor02
resource "docker_container" "container_servidor_web02" {
  name         = "servidor_web02"
  image = "nginx:latest"
   ports {
    external = var.web_server_port02
    internal = 80
    
}

}