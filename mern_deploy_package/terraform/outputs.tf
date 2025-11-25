output "droplet_id" {
  value = digitalocean_droplet.web.id
}

output "droplet_ipv4" {
  value = digitalocean_droplet.web.ipv4_address
}
