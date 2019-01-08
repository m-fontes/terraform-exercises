provider "aws" {
  #access_key = ""
  #secret_key = ""
  # define both values above as env vars: AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
  region     = "sa-east-1"
}

resource "aws_instance" "example" {
  # Amazon Machine Image below is from Ubuntu Server 18.04 from South America East
  ami           = "ami-03c6239555bb12112"
  instance_type = "t2.micro"
}

