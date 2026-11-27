output "web_1_url" {
  description = "Lokaler Endpunkt Instanz 1"
  value       = "http://localhost:8081"
}

output "web_2_url" {
  description = "Lokaler Endpunkt Instanz 2"
  value       = "http://localhost:8082"
}

output "network_id" {
  description = "ID des erstellten Docker-Netzwerks"
  value       = docker_network.platform_net.id
}
