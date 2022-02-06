data aws_route53_zone domain {
  count = var.dns == null ? 0 : 1
  name         = var.dns.domain
  private_zone = false
}

resource aws_route53_record record {
  count = var.dns == null ? 0 : 1
  zone_id = data.aws_route53_zone.domain[0].zone_id
  name = "${var.dns.subdomain}.${data.aws_route53_zone.domain[0].name}"
  type = "A"
  ttl = var.dns.ttl
  records = [aws_instance.instance.public_ip]
}