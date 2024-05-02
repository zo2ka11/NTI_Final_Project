#!/bin/bash

# Define environment variables
DB_HOST=terraform-20240426154904719900000001.cv08eu8qkx5i.us-east-1.rds.amazonaws.com
DB_USER=Admin
DB_PASSWORD=Admin
DB_DATABASE=mydb

# SQL query
SQL_QUERY="
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  is_complete BOOLEAN DEFAULT false
);
"

docker run --rm mysql:latest mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_DATABASE" -e "$SQL_QUERY"