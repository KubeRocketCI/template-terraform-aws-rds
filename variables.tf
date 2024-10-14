# AWS region where resources will be created
variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
}

# List of subnet IDs for the RDS DB subnet group
variable "subnet_ids" {
  description = "List of subnet IDs for the RDS DB subnet group"
  type        = list(string)
}

# Family of the DB parameter group
variable "db_parameter_family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "postgres16" # Specify a default value if needed
}

# Name of the DB subnet group
variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "rds-db-subnet-group"
}

# Identifier for the RDS instance
variable "db_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

# Instance class for the RDS instance
variable "db_instance_class" {
  description = "The class of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

# Database engine to be used for the RDS instance
variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "postgres"
}

# Database engine version for the RDS instance
variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "16.3"
}

# Allocated storage (in GB) for the RDS instance
variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance (in GB)"
  type        = number
}

# Database name
variable "db_name" {
  description = "The name of the database"
  type        = string
}

# Username for the database
variable "db_username" {
  description = "The username for the database"
  type        = string
}

# Whether the database should be publicly accessible
variable "db_publicly_accessible" {
  description = "Indicates if the database should be publicly accessible"
  type        = bool
  default     = false
}

# Whether to skip the final snapshot when deleting the database
variable "db_skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the database"
  type        = bool
  default     = true
}

# Tag name for the RDS instance
variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(any)
}
