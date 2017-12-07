resource "aws_route_table" "public-route-table" {
    vpc_id     = " ${aws_vpc.rootconf-vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"

    }

    tags {
        "Name" = "public-route-table"
        "Environment" = "${var.environment}"
    }
}
