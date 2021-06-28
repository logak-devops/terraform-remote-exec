provider "aws" {
   region = "us-east-1"
   shared_credentials_file = "/root/.aws/credential"
}



resource "aws_instance" "web" {
  ami = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t2.micro"
  key_name = "Archu-acc"
  vpc_security_group_ids = ["sg-0368cc2c7e2599a00"]
  subnet_id = "subnet-dea926ef"
  tags = {
     Name = "nodejs"
  }
}

resource "null_resource" "copy_execute"{

  connection {
     type = "ssh"
     host = aws_instance.web.public_ip
     user = "ec2-user"
     private_key = file("Archu-acc.pem")
  }

  provisioner "file" {
     source = "/opt/script.sh"
     destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
     inline = [
       "chmod +x /tmp/script.sh",
       "/tmp/script.sh args",
     ]
  }

  depends_on = [ aws_instance.web ]
}


