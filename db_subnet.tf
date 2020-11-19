resource "aws_db_subnet_group" "db_subnet_group" {
    subnet_ids  = [aws_subnet.pub_subnet.id, aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}
