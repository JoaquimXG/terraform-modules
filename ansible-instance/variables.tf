variable region {}
variable az {}
variable vpc_id {}
variable subnet_id {}

variable tags {
  type = map(string)

  validation {
    condition = length(var.tags.Name) > 0
    error_message = "Name tag must be provided."
  }
}

variable playbook_path {}
variable ansible_vars {
  type = map
}

variable hibernation {
  type = bool
  default = false
}

variable ami {
  type = map(string)
  default = {
    name_filter = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    owner = "099720109477" # Canonical
    user = "ubuntu"
  }
}

variable security_group_id {
  default = null
}

variable instance_type {
  default = "t2.micro"
}

variable key_name {
  default = "aws-personal"
}

variable priv_key_path {
  default = "~/.ssh/aws-personal.pem"
}

variable dns {
  type = map(string)
  # default = {
  #   subdomain = "tf-test"
  #   domain = "joaquimgomez.com
  #   ttl = 60
  # }
  default = null
} 