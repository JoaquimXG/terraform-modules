variable az {}

data aws_vpc vpc {
    default = true
}

data aws_subnet subnet {
    availability_zone = var.az
    default_for_az = true
    vpc_id = data.aws_vpc.vpc.id
}

output vpc_id {
    value = data.aws_vpc.vpc.id
}

output subnet_id {
    value = data.aws_subnet.subnet.id
}