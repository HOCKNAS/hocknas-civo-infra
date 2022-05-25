resource "local_sensitive_file" "kubeconfig" {
  content  = module.k3s_cluster.kubeconfig
  filename = local.kubeconfig_path
  depends_on = [
    module.k3s_cluster
  ]
}

resource "kubernetes_namespace" "ingress_ns" {
  metadata {
    name = "${local.name}-ingress-ns"
  }
  depends_on = [
    module.k3s_cluster
  ]
}

resource "kubernetes_namespace" "main_ns" {
  metadata {
    name = "${local.name}-ns"
  }
  depends_on = [
    module.k3s_cluster
  ]
}