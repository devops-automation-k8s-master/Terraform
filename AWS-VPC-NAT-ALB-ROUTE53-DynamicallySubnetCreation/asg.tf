# Create AWS launch template with given ami-id
resource "aws_launch_template" "lt" {
  name_prefix = "test-launch-temp"
  image_id    = "${var.ami_id}"
}

#Create AWS autoscaling group in two private subnet with configurable instance distribuation attribute.
resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = ["${aws_subnet.private-subnets.*.id[0]}", "${aws_subnet.private-subnets.*.id[1]}"]
  desired_capacity    = "${var.asg_desired_size}"
  max_size            = "${var.asg_max_size}"
  min_size            = "${var.asg_min_size}"

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.lt.id}"
      }

      override {
        instance_type = "t2.micro"
      }

      override {
        instance_type = "m3.medium"
      }
    }

    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 1
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 2
      spot_max_price                           = .001
    }
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
  alb_target_group_arn   = "${aws_alb_target_group.ftg.arn}"
}
