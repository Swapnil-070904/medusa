resource "aws_db_instance" "medusa_db" {
  identifier             = "medusa"
  engine                 = "postgres"
  engine_version         = "17.2"
  instance_class         = "db.t4g.micro"
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = true
  skip_final_snapshot    = true
  multi_az               = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "medusa-db-subnet"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow DB access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ssm_parameter" "db_url" {
  name  = "/medusa/db-url"
  type  = "SecureString"
  value = "postgresql://${var.db_username}:${var.db_password}@${aws_db_instance.medusa_db.address}:5432/medusa?sslmode=require"
}