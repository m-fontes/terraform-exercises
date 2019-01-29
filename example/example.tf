provider "aws" {
  #access_key = ""
  #secret_key = ""
  # define both values above as env vars: AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
  region     = "sa-east-1"
}

resource "aws_key_pair" "deployer" {
  # this public SSH key will be "injected" into the EC2 instance. 'key_name' attribute links both resources
  key_name = "mfontes-pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcjywF//zx7SDWwE6X0Pnw95q5On8vS8g5FKm7DQKBmHBykGxB5Z2pElHXR46LKjHfvMzAB15v7ECsPZs6eR+6VWw/R6MKCav4xDlfpZd2F8A67kRsCSCE6qfQoDjZohc2P2nZHgeM5nMBihnQZ5D/mLzv8Dn9pl0rae9cVQpolZ0lIRQZRCHZcbs9x4QcydJ0MI1+cRhWQ9GjlFAbXck7Rg9JcV8YUUGV3lCOwGMAedQFXmE1eo3zG0U9MwJ6Fo9cYrdyEELH7GarqL8o0aqsqXILYrNYUmeudwzyeW3OxlgRYcwd3tw6OIws898KSAV4QqJsO3jzxZAk8yHliEQH mfontes@MACCIT014402.local"
}

resource "aws_instance" "example" {
  # Amazon Machine Image below is from Ubuntu Server 18.04 from South America East
  ami           = "ami-03c6239555bb12112"
  instance_type = "t2.micro"
  key_name = "mfontes-pub"
}

