output name {
  value = kubernetes_secret.secret.metadata[0].name
}

output data {
  value = var.data
}
