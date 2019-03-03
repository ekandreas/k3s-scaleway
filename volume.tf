#resource "scaleway_volume" "extra" {
#  name = "extra"
#  size_in_gb = 100
#  type = "l_ssd"
#}

#resource "scaleway_volume_attachment" "extra" {
#  server = "${scaleway_server.k3s_master.id}"
#  volume = "${scaleway_volume.extra.id}"
#}
