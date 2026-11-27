terraform {
  required_version = ">= 1.5.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Isoliertes Bridge-Netzwerk für unsere Plattform-Services
resource "docker_network" "platform_net" {
  name = "hf_sys_platform_net"
  ipam_config {
    subnet = "172.28.0.0/16"
  }
}

# Referenz auf das in Sprint 1 lokal gebaute Image
data "docker_image" "app_image" {
  name = var.image_tag
}

# Instanz 1 der Web-Applikation
resource "docker_container" "web_1" {
  name  = "hf-sys-web-1"
  image = data.docker_image.app_image.image_id

  env = [
    "APP_VERSION=${var.app_version}"
  ]

  ports {
    internal = 8080
    external = 8081
  }

  networks_advanced {
    name = docker_network.platform_net.name
  }

  restart = "unless-stopped"
}

# Instanz 2 der Web-Applikation (Redundanz / Skalierung)
resource "docker_container" "web_2" {
  name  = "hf-sys-web-2"
  image = data.docker_image.app_image.image_id

  env = [
    "APP_VERSION=${var.app_version}"
  ]

  ports {
    internal = 8080
    external = 8082
  }

  networks_advanced {
    name = docker_network.platform_net.name
  }

  restart = "unless-stopped"
}
