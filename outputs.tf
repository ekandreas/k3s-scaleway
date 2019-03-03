output "k3s_master_public_ip" {
  value = "${scaleway_server.k3s_master.public_ip}"
}

output "k3s_master_private_ip" {
  value = "${scaleway_server.k3s_master.private_ip}"
}

