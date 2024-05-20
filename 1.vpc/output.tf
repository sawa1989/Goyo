output "vpc_id" {
  value = module.vpc.vpc_id
}
output "azs" {
  value = module.vpc.azs
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "private_subnets" {
  value = module.vpc.private_subnets
}
output "private_subnet_arns" {
  value = module.vpc.private_subnet_arns
}
output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}
output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}
output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}