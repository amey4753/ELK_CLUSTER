# Provision  elasticsearch instance using Ubuntu on a
# t2.micro node 

# Create 

provider "aws" {

    region = "ap-south-1"
  
}
resource "aws_instance" "Node" {
  ami           = "ami-073c8c0760395aab8"
  count         =  3
  security_groups = ["${aws_security_group.SG1.name}"]
  key_name = "es"
  availability_zone = "ap-south-1a"
  instance_type = "t2.micro"
  user_data = "${file("install_script.sh")}"

  tags = {
        Name  = "Node_${count.index}"

  }

}
resource "aws_security_group" "SG1" {
  name        = "SG1"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9300
    to_port     = 9300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
  


