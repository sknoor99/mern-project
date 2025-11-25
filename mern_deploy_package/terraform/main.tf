terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.0.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "mern-droplet"
  region = var.region
  size   = var.size
  ssh_keys = var.ssh_keys
  tags = ["mern", "docker"]
}

resource "digitalocean_firewall" "fw" {
  name = "mern-fw"
  droplet_ids = [digitalocean_droplet.web.id]

  inbound_rule {
    protocol = "tcp"
    port_range = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol = "tcp"
    port_range = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol = "tcp"
    port_range = "9443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}
