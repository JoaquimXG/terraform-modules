output vpc_id {
    value = data.aws_vpc.vpc.id
}

output subnet_id {
    value = data.aws_subnet.subnet.id
}