resource "scaleway_ip" "k3s_master_ip" {}

resource "scaleway_server" "k3s_master" {
  count = 1
  name = "${terraform.workspace}-master"
  image = "${data.scaleway_image.ubuntu.id}"
  type = "${var.server_type}"
  public_ip = "${scaleway_ip.k3s_master_ip.ip}"
  security_group = "${scaleway_security_group.master_security_group.id}"
  tags = [
    "k3s",
    "master",
    "${terraform.workspace}"
  ]

  connection {
    type = "ssh"
    user = "root"
    private_key = "${file(var.private_key)}"
  }

  provisioner "file" {
    source = "scripts/master.sh"
    destination = "/tmp/master.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/master.sh",
      "/tmp/master.sh",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "cat /etc/rancher/k3s/k3s.yaml",
      "cat /var/lib/rancher/k3s/server/node-token"
    ]
  }
}
