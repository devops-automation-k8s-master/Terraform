#Details of aws route53 zone as data input
data "aws_route53_zone" "zone" {
  name = "${var.apex_domain}"
}

#Create AWS route53 record 
resource "aws_route53_record" "url" {
  zone_id = "${data.aws_route53_zone.zone.zone_id}"
  name    = "terraform-test.${var.apex_domain}"
  type    = "A"

  alias {
    name                   = "${aws_alb.alb.dns_name}"
    zone_id                = "${aws_alb.alb.zone_id}"
    evaluate_target_health = true
  }
}
