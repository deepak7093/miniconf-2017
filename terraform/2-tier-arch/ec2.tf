resource "aws_instance" "rootconf-ubuntu" {
   ami                         = "${var.ami_ubuntu}"
   availability_zone           = "${var.az1}"
   ebs_optimized               = false
   instance_type               = "${var.instance_type}"
   monitoring                  = false
   key_name                    = "rootconf-key"
   subnet_id                   = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids      = ["${aws_security_group.web-security-group.id}"]
   associate_public_ip_address = true
   source_dest_check           = true

   root_block_device {
       volume_type           = "gp2"
       volume_size           = 300
       delete_on_termination = false
   }

   tags {
       "Name" = "ubuntu-server"
       "Environment" = "testing"
   }
}

resource "aws_instance" "rootconf-centos" {
   ami                         = "${var.ami_centos}"
   availability_zone           = "${var.az1}"
   ebs_optimized               = false
   instance_type               = "${var.instance_type}"
   monitoring                  = false
   key_name                    = "rootconf-key"
   subnet_id                   = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids      = ["${aws_security_group.web-security-group.id}"]
   associate_public_ip_address = true
   source_dest_check           = true

   root_block_device {
       volume_type           = "gp2"
       volume_size           = 300
       delete_on_termination = false
   }

   tags {
       "Name" = "ubuntu-server"
       "Environment" = "testing"
   }
}
