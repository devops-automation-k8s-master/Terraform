# Common
region          = "us-east-1"
owner           = "goldcast"
environment     = "developement"
project         = "test"
network         = "all"
# VPC
cidr_block = "172.17.0.0/16"
zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

private_subnets = [
  "172.17.4.0/24",
  "172.17.5.0/24",
  "172.17.6.0/24"
]


