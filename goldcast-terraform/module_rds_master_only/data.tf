# --- Network ---
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.owner}-${var.environment}-${var.project}-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Type = "private"
  }
}


data "aws_subnets" "all_private" {
   filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Type = "private"
  }
}

