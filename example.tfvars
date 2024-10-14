region = "eu-central-1" # mandatory

subnet_ids = [
  "subnet-02d316396aac5c555",
  "subnet-0320d27f0e986fc1e"
] # mandatory

tags = {
  "SysName" = "SysName"
  "Project" = "Project"
} # isn't mandatory

db_name = "rds" # mandatory

db_username = "user" # mandatory

db_allocated_storage = "5" # mandatory

db_instance_identifier = "rds-db" # mandatory
