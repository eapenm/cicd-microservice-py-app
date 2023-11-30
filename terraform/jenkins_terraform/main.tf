resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-security-group"
  description = "Jenkins Security Group to give access to different ports required to develop the pipeline"

  # Define a single ingress rule to allow traffic on all specified ports
  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "Created Securty Group for Jenkins"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-SG"
  }
}


resource "aws_instance" "web" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.medium"
  key_name               = "Robin"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data              = templatefile("./install_jenkins.sh", {})

  tags = {
    Name = "Jenkins Server"
  }
  root_block_device {
    volume_size = 30
  }
}
