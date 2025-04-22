output "servidor_web01_nombre" {
    value       = docker_container.container_servidor_web01.name
}

output "servidor_web01_puerto" {
  value       = docker_container.container_servidor_web01.ports[0].external
}