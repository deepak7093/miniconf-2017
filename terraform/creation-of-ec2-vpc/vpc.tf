resource "aws_vpc" "rootconf-vpc" {
    cidr_block           = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags {
        "Name" = "rootconf-vpc"
        "ManagedBy" = "CloudCover"
        "Environment" = "${var.environment}"
    }
}
