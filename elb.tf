resource "aws_elb" "yk" {
  name               = "yk-elb"
  availability_zones = ["us-east-1a", "us-east-1b"]



  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   =["${aws_instance.server1.id}","${aws_instance.server2.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 40

  tags = {
    Name = "terraform-elb"
  }
}