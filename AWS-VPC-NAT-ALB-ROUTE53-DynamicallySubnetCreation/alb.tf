#AWS acm certificate as data input 
data "aws_acm_certificate" "acm" {
  domain      = "*.${var.apex_domain}"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}



/*data "aws_acm_certificate" "acm" {
  domain   = "*.${var.apex_domain}"
  types    = ["IMPORTED"]
  statuses = ["ISSUED"]

  most_recent = true
}*/

#Create AWS-ALB and attached two public subnets to this alb.
resource "aws_alb" "alb" {
  name    = "alb"
  subnets = ["${aws_subnet.public-subnets.*.id[0]}", "${aws_subnet.public-subnets.*.id[1]}"]
}

#Create AWS Target group
resource "aws_alb_target_group" "ftg" {
  name     = "alb-target-group"
  port     = "${var.target_group_port}"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.vpc.id}"
}

#Create AWS HTTPS listener and default rule is attached to ftg target group.
resource "aws_alb_listener" "https-listner" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.acm.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.ftg.arn}"
  }
}

#Create AWS http-redirect-listner to https.
resource "aws_alb_listener" "http-redirect-listner" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
