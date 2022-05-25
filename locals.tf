locals {
  name   = "hocknas"
  region = "NYC1"

  rules = {
    action     = ["allow", "allow"]
    protocol   = ["udp", "tcp"]
    start_port = ["1", "1", ]
    end_port   = ["65535", "65535", ]
    cidr       = ["0.0.0.0/0", "0.0.0.0/0"]
    direction  = ["ingress", "ingress"]
  }

  kubeconfig_path = "${path.module}/.kube/config"

  tags = ""
}