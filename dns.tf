provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

resource "cloudflare_record" "k3s_master" {
  domain = "${var.cloudflare_zone}"
  name   = "k3s"
  value  = "${scaleway_ip.k3s_master_ip.ip}"
  type   = "A"
  ttl    = 1
  proxied = true
}

resource "cloudflare_record" "all_nodes" {
  domain = "${var.cloudflare_zone}"
  name   = "default"
  value  = "${scaleway_ip.k3s_master_ip.ip}"
  type   = "A"
  ttl    = 1
  proxied = true
}

resource "cloudflare_record" "www" {
  domain = "${var.cloudflare_zone}"
  name   = "www"
  value  = "${scaleway_ip.k3s_master_ip.ip}"
  type   = "A"
  ttl    = 1
  proxied = true
}

resource "cloudflare_record" "at" {
  domain = "${var.cloudflare_zone}"
  name   = "@"
  value  = "${scaleway_ip.k3s_master_ip.ip}"
  type   = "A"
  ttl    = 1
  proxied = true
}
