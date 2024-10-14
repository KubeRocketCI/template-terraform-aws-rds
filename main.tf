module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.10.0"

  # RDS instance configuration
  identifier           = var.db_instance_identifier
  instance_class       = var.db_instance_class
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  allocated_storage    = var.db_allocated_storage
  db_name              = var.db_name
  username             = var.db_username
  publicly_accessible  = var.db_publicly_accessible               # Specify if the database should be publicly accessible
  skip_final_snapshot  = var.db_skip_final_snapshot               # Whether to skip the final snapshot on deletion
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name # Name of the subnet group to use

  # Additional RDS settings
  family                              = var.db_parameter_family # Database parameter family (e.g., postgres10)
  auto_minor_version_upgrade          = true                    # Automatically upgrade minor versions
  monitoring_interval                 = 0                       # Set to 0 to disable enhanced monitoring; >0 enables it
  performance_insights_enabled        = true                    # Enable performance insights for the RDS instance
  deletion_protection                 = false                   # Enable deletion protection to prevent accidental deletion
  multi_az                            = true                    # Enable Multi-AZ for high availability
  storage_encrypted                   = true                    # Enable encryption at rest for the database
  backup_retention_period             = 7                       # Number of days to retain backups
  enabled_cloudwatch_logs_exports     = ["postgresql"]          # Enable CloudWatch logs export for PostgreSQL
  iam_database_authentication_enabled = true                    # Enable IAM authentication for the database
  manage_master_user_password         = true                    # Manage the master user password in Secrets Manager

  # Resource tags for identification
  tags = var.tags

}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name # Name of the subnet group
  subnet_ids = var.subnet_ids           # Subnet IDs associated with the subnet group
  tags       = merge(var.tags, tomap({ "Name" = var.db_name }))
}
