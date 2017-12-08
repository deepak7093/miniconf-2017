resource "aws_security_group" "web-security-group" {
    name        = "web-security-group"
    description = "This security group will be used by EC2"
    vpc_id      = "${aws_vpc.rootconf-vpc.id}"

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}

output "security-group" {
  value = "${aws_security_group.web-security-group.id}"
}
