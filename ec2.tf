data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["alanteste-terraform-${var.hash_commit}"]
  }

  owners = ["178520105998"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}