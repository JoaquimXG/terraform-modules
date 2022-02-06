output public_ip {
  value = aws_instance.instance.public_ip
}

output private_ip {
  value = aws_instance.instance.private_ip
}

output dns {
  value = var.dns == null ? null : aws_route53_record.record[0].name
}