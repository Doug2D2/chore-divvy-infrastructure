resource "aws_security_group" "chore_divvy_web_sg" {
    name        = "chore_divvy_web_sg"
    description = "Security group for Chore Divvy web server"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ChoreDivvy-Web-SG"
        App  = "ChoreDivvy"    
    }
}

resource "aws_instance" "chore_divvy_web" {
    ami                    = var.ami
    instance_type          = "t2.micro"
    key_name               = "chore-divvy"
    user_data              = file("./modules/web/userdata.sh")
    iam_instance_profile   = var.iam_profile_name
    vpc_security_group_ids = [aws_security_group.chore_divvy_web_sg.id]

    tags = {
        Name = "ChoreDivvy-Web"
        App  = "ChoreDivvy"     
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = 10 
    }
}
