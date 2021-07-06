data "aws_route53_zone" "primary" {
  name = "jamesrcounts.com"
}

resource "aws_route53_record" "aks" {
  for_each = local.clusters

  zone_id = data.aws_route53_zone.primary.zone_id
  name    = each.value
  type    = "A"
  ttl     = "300"
  records = [module.aks[each.key].load_balancer_ip_address] # Can the k8s layer just query DNS?
}