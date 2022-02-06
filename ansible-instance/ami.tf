data aws_ami image {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami.name_filter]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami.owner]
}