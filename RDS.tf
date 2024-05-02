resource "aws_db_instance" "mysql" {
    allocated_storage = 10
    db_name = "DataBase"
    engine = "mysql"
    engine_version = 5.2
    instance_class = "db.t3.micro"
    username = "root"
    password = "MinaSamy10;"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot  = true
    publicly_accessible = true
}