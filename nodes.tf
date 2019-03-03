resource "scaleway_ip" "k3s_node_ip" {
  count = "${var.nodes}"
}

resource "scaleway_server" "k3s_node" {
  count          = "${var.nodes}"
  name           = "${terraform.workspace}-node-${count.index + 1}"
  image          = "${data.scaleway_image.ubuntu.id}"
  type           = "${var.server_type}"
  public_ip      = "${element(scaleway_ip.k3s_node_ip.*.ip, count.index)}"
  security_group = "${scaleway_security_group.node_security_group.id}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file(var.private_key)}"
  }

}
