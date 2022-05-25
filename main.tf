module "network" {
  source = "git@github.com:HOCKNAS/hocknas-civo-terraform-network.git"

  label  = "${local.name}-network"
  region = local.region

}

module "firewall" {
  source = "../hocknas-civo-terraform-firewall"

  firewall_name = "${local.name}-firewall"
  label         = "${local.name}-firewall"
  network_id    = module.network.network_id
  region        = local.region
  map_rules     = local.rules

}

module "k3s_cluster" {
  source = "../hocknas-civo-terraform-eks"

  cluster_name        = "${local.name}-cluster"
  region              = local.region
  cni                 = "flannel"
  kubernetes_version  = "1.22.2-k3s1"
  network_id          = module.network.network_id
  firewall_id         = module.firewall.firewall_id
  authorized_networks = ["0.0.0.0/0"]
  tags                = local.tags
  applications        = "prometheus-operator"

  main_node_label         = "${local.name}-main"
  main_node_count         = 2
  main_node_instance_size = "g4s.kube.medium"

  node_pools = [{
    label      = "${local.name}-extra"
    node_count = 1
    region     = local.region
    size       = "g4s.kube.medium"
  }]

}

