variable network_base_cidr {
type = "string"
default = "172.16.0.0/16"
description ="Enter the NetworkBaseCidr"
}

variable subnet_size {
default = 1000
description = "Enter the number of Hosts/EC2 machine,Want to deploy in a subnet.Example:- 1000 machine in a subnet"
}

variable apex_domain {
  type    = "string"
  default = "dopsak.xyz"
description = "Enter the domain name.Example: xyz.com"
}

variable asg_max_size {
default = 1
description = "ASG max size"
}

variable asg_min_size {
default = 1
description = "ASG min size"
}

variable asg_desired_size {
default =1
}

variable ami_id {
type = "string"
default = "ami-005bdb005fb00e791"
description = "Set the ami_id, which is available in a given region,default value set for us-west-2 region"
}


variable target_group_port {
default = 80
description = "Target group Port."

}
