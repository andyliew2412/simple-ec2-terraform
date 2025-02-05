# This code block allows us to create an ec2 instance with hardcoded values
resource "aws_instance" "sample_ec2_hardcoded" {
  ami           = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  key_name      = "luqman-useast1-13072024" # Replace key_name with your own keypair name in the corresponding region
  subnet_id     = "subnet-09acf5721004f526c" # Replace subnet_id with your own vpc's subnet id (see Subnets in AWS console)
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "luqman-webserver-terraform" # Replace Name with your own preferred EC2 instance name
  }
}

# This code block allows us to create an ec2 instance with the use of variables
# To overwrite any one particular variable, we can pass the variable at runtime during terraform apply step
# e.g. terraform apply --var ec2_name="my-var-webserver"
resource "aws_instance" "sample_ec2_variables" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = data.aws_subnet.selected_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.ec2_name
  }
}