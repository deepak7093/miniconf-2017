resource "aws_elb" "rootconf-elb" {
    name                        = "rootconf-elb"
    subnets                     = ["${aws_subnet.public-subnet.id}"]
    security_groups             = ["${aws_security_group.elb-security-group.id}"]
    instances                   = ["${compact(split(",", join(",",aws_instance.rootconf-ubuntu.*.id)))}","${compact(split(",", join(",",aws_instance.rootconf-centos.*.id)))}"]
    //cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 300
    internal                    = true
    depends_on                  = ["aws_instance.rootconf-ubuntu"]
    depends_on                  = ["aws_instance.rootconf-centos"]

    listener {
        instance_port      = 80
        instance_protocol  = "http"
        lb_port            = 80
        lb_protocol        = "http"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 5
        unhealthy_threshold = 2
        interval            = 10
        target              = "TCP:80"
        timeout             = 5
    }

    tags {
        "ManagedBy" = "CloudCover"
        "Environment" = "${var.environment}"
        "Name" = "rootconf-elb"
    }
}
