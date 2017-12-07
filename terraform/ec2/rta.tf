resource "aws_route_table_association" "rootconf-public-rt-subnet" {
    route_table_id = "${aws_route_table.public-route-table.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
}
