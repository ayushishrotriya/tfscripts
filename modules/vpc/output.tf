output "vpc_id" {
    value = aws_vpc.my-vpc.id
}

output "igw-id" {
    value = aws_internet_gateway.igw.id
}

output "public-subnet-id" {
    value = aws_subnet.public-subnet.*.id
}

output "private-subnet-id" {
    value =  aws_subnet.private-subnet.*.id
}

output "eip-id" {
    value = aws_eip.nat_gateway.id
}

output "private-RT" {
    value =  aws_route_table.private-RT.id
}

output "nat-gateway-id" {
    value = aws_nat_gateway.nat_gateway.id
}