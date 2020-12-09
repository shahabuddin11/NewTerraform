output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.dev-igw.id
}
output "public_subnet_ids" {
  description = "The IDs of the subnets"
  value       = aws_subnet.public-1.id
}
output "aws_route_table_ids" {
  description = "The ID of the routing table"
  value       = aws_route_table.dev-public-crt.id
}
output "nat_gateway_ids" {
  value = aws_nat_gateway.gw.id
}