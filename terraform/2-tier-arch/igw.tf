resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.rootconf-vpc.id}"

    tags {
        "Name" = "rootconf-igw"
    }
}
