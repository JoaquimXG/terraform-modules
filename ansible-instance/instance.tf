locals {
	formatted_string = join(" ", [for key, value in var.ansible_vars: "${key}=${value}"])
}


resource aws_instance instance {
  ami           = data.aws_ami.image.id
  key_name = var.key_name
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  availability_zone = var.az

  vpc_security_group_ids = var.security_group_id == null ? [aws_security_group.sg[0].id] : [var.security_group_id]
  
  provisioner remote-exec {
    inline = ["# Connected!"]

    connection {
      type = "ssh"
      user = var.ami.user
      private_key = file(var.priv_key_path)
      host = self.public_ip
    }
  }
  
  provisioner local-exec {
    command = "ansible-playbook -i ${self.public_ip}, -u ${var.ami.user} --private-key ${var.priv_key_path} ${var.playbook_path} -e '${local.formatted_string}'" 
  }

  tags = {
    Name    = var.tag_name
  }
}

