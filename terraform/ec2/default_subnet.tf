resource "aws_default_subnet" "default_subnet" {
  availability_zone = "ap-southeast-1"

    tags {
        Name = "Default subnet for us-west-2a"
    }
}
