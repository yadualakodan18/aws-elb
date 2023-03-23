resource "aws_instance" "server1" {
  ami           = "ami-02f3f602d23f1659d" 
  instance_type = "t2.micro"
  key_name      = "ykey"
  security_groups=["elb-sg"]
  user_data = <<EOF
  #!bin/bash
  yum install httpd -y
  service httpd start
  chkcongig httpd on
  echo "THIS IS THE FIRST WEB SERVER" > /var/www/html/index.html
  EOF
  tags = {
    Name="First server"
    Source="terraform"
  }
}


  resource "aws_instance" "server2" {
  ami           = "ami-02f3f602d23f1659d" 
  instance_type = "t2.micro"
  key_name      = "ykey"
  security_groups=["elb-sg"]
  user_data = <<EOF
  #!bin/bash
  yum install httpd -y
  service httpd start
  chkcongig httpd on
  echo "THIS IS THE SECOND WEB SERVER" > /var/www/html/index.html
  EOF
  tags = {
    Name="Second server"
    Source="terraform"
  }
  }
