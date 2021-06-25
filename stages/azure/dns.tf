data "aws_route53_zone" "primary" {
  name = "jamesrcounts.com"
}

resource "aws_route53_record" "aks_dmz" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "dmz.jamesrcounts.com"
  type    = "A"
  ttl     = "300"
  records = [module.aks_dmz.load_balancer_ip_address]
}

resource "aws_route53_record" "aks_svc" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "svcs.jamesrcounts.com"
  type    = "A"
  ttl     = "300"
  records = [module.aks_svc.load_balancer_ip_address]
}