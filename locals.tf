locals {
  name   = "hocknas"
  region = "NYC1"

  rules = {
    action     = ["allow", "allow", "allow", "deny", "deny"]
    protocol   = ["tcp", "tcp", "tcp", "udp", "tcp"]
    start_port = ["80", "443", "6443", "1", "1", ]
    end_port   = ["80", "443", "6443", "65535", "65535", ]
    cidr       = ["0.0.0.0/0", "0.0.0.0/0", "3.212.207.103/32", "0.0.0.0/0", "0.0.0.0/0"]
    direction  = ["ingress", "ingress", "ingress", "ingress", "ingress"]
  }

  kubeconfig_path = "${path.module}/.kube/config"

  tags = "k3s kubernetes hocknas terraform"
}