resource "aws_subnet" "public-subnet" {
    vpc_id                  = "${aws_vpc.rootconf-vpc.id}"
    cidr_block              = "${var.public_cidr}"
    availability_zone       = "ap-southeast-1a"
    map_public_ip_on_launch = true

    tags {
        "Name" = "public-subnet"
        "ManagedBy"   = "CloudCover"

    }
}
