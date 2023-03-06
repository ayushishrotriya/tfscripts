resource "aws_vpc" "my-vpc" {
  cidr_block       = "${var.cidr_block}"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  count      = "${length(var.public_subnets_cidr)}"
  cidr_block = "${element(var.public_subnets_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  count      = "${length(var.private_subnets_cidr)}"
  cidr_block = "${element(var.private_subnets_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_route_table_association" "public-RT-association" {
  route_table_id = aws_route_table.public-RT.id
  count          = "${length(var.public_subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.public-subnet.*.id, count.index)}"
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}


resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public-subnet[0].id # Associate the NAT Gateway with the first private subnet

  tags = {
    "Name" = "my-vpc"
  }
}

resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_route" "private-route" {
  route_table_id         = aws_route_table.private-RT.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "private-RT-association" {
  count          = "${length(var.private_subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.private-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.private-RT.id}"
}