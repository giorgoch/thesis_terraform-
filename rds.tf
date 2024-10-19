# PostgreSQL RDS Instance
resource "aws_db_instance" "postgresql" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres12"
  publicly_accessible  = true
  skip_final_snapshot  = true  

  tags = {
    Name = "MyPostgresDB"
  }
}
