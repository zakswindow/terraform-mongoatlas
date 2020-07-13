# Create the peering connection request
resource "mongodbatlas_network_peering" "dev" {
  provider               = mongodbatlas.mongo
  accepter_region_name   = var.region
  project_id             = mongodbatlas_project.dev.id
  container_id           = mongodbatlas_cluster.cluster.container_id
  provider_name          = "AWS"
  route_table_cidr_block = data.terraform_remote_state.test.outputs.vpc_cidr_block
  vpc_id                 = data.terraform_remote_state.test.outputs.vpc_id
  aws_account_id         = var.DevAccountID
}

# the following assumes an AWS provider is configured
# Accept the peering connection request
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.dev
  vpc_peering_connection_id = mongodbatlas_network_peering.dev.connection_id
  auto_accept               = true

  tags = {
    Name = "Peering - Dev VPC to MongoDB Atlas"
  }
}

resource "mongodbatlas_project_ip_whitelist" "vpc_cidr" {
  provider   = mongodbatlas.mongo
  project_id = mongodbatlas_project.dev.id
  cidr_block = data.terraform_remote_state.test.outputs.vpc_cidr_block
  comment    = "Allow Dev VPC CIDR to access MongoDB Atlas"
}

resource "mongodbatlas_project_ip_whitelist" "vpn" {
  provider   = mongodbatlas.mongo
  project_id = mongodbatlas_project.dev.id
  cidr_block = var.vpn_ip
  comment    = "Allow Office VPN IP to access MongoDB Atlas"
}

resource "mongodbatlas_project_ip_whitelist" "sftp_server" {
  provider   = mongodbatlas.mongo
  project_id = mongodbatlas_project.dev.id
  cidr_block = var.sftp_ip
  comment    = "Allow SFTP server to access MongoDB"
}
