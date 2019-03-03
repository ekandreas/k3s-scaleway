provider "scaleway" {
  region  = "${var.region}"
  organization = "${var.scw_org}"
  token        = "${var.scw_token}"
}

data "scaleway_image" "ubuntu" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}