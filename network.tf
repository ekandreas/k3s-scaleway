# Master
resource "scaleway_security_group" "master_security_group" {
  name        = "k3s.master.${terraform.workspace}"
  description = "K3S Master Security Group"
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "https_master_management_accept" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 6443
}

resource "scaleway_security_group_rule" "https_web_accept" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 80
}

resource "scaleway_security_group_rule" "https_web_ssl_accept" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}

# Node
resource "scaleway_security_group" "node_security_group" {
  name        = "k3s.node.${terraform.workspace}"
  description = "K3S Node Security Group"
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}
