output "k3s_master_public_ip" {
  value = "${scaleway_server.k3s_master.public_ip}"
}

output "k3s_master_private_ip" {
  value = "${scaleway_server.k3s_master.private_ip}"
}

#output "k3s_config" {
#  value = "${data.external.config.result}"
#}

#output "k3s_token" {
#  value = "${data.external.token.result}"
#}
