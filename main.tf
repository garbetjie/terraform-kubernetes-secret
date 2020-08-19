resource random_id name_suffix {
  byte_length = 3
  keepers = {
    data = jsonencode(var.data)
  }
}

resource kubernetes_secret secret {
  metadata {
    name = "${var.name}-${random_id.name_suffix.hex}"
    namespace = var.namespace
  }

  data = var.data

  lifecycle {
    create_before_destroy = true
  }
}
