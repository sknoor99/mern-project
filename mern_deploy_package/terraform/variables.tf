variable "do_token" {
  description = "DigitalOcean API token"
  type = string
  sensitive = true
}

variable "region" {
  description = "Droplet region"
  type = string
  default = "nyc3"
}

variable "size" {
  description = "Droplet size"
  type = string
  default = "s-1vcpu-1gb"
}

variable "ssh_keys" {
  description = "List of SSH key IDs or fingerprints available in the DO account"
  type = list(string)
  default = []
}
