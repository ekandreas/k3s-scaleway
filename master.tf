resource "scaleway_ip" "k3s_master_ip" {}

resource "scaleway_server" "k3s_master" {
  count          = 1
  name           = "${terraform.workspace}-master"
  image          = "${data.scaleway_image.ubuntu.id}"
  type           = "${var.server_type}"
  public_ip      = "${scaleway_ip.k3s_master_ip.ip}"
  security_group = "${scaleway_security_group.master_security_group.id}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file(var.private_key)}"
  }
}
