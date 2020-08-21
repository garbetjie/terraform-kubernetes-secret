variable namespace {
  type = string
}

variable name {
  type = string
}

variable add_name_suffix {
  type = bool
  default = true
}

variable data {
  type = map(string)
  default = {}
}

locals {
  keepers = {
    for key, value in var.data:
      key => sha256(value)
  }
}
