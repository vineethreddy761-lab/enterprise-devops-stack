terraform {
  required_version = ">= 1.0.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_network" "enterprise_net" {
  name   = var.network_name
  driver = "bridge"
}

resource "docker_container" "enterprise_nodes" {
  count    = var.node_count
  image    = "ubuntu:22.04"
  name     = "enterprise-node-${count.index + 1}"
  hostname = "node-${count.index + 1}"
  must_run = true
  command  = ["sleep", "infinity"]

  networks_advanced {
    name = docker_network.enterprise_net.name
  }
}
