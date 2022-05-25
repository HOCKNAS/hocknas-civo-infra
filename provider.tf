provider "civo" {
  token  = var.civo_token
  region = local.region
}

provider "kubernetes" {
  config_path    = local.kubeconfig_path
  config_context = "${local.name}-cluster"
}