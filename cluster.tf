resource "mongodbatlas_cluster" "cluster" {
  project_id                   = mongodbatlas_project.dev.id
  provider                     = mongodbatlas.mongo
  name                         = "dev"
  num_shards                   = 1
  replication_factor           = 3
  provider_backup_enabled      = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "4.2"

  //Provider Settings "block"
  provider_name               = "AWS"
  disk_size_gb                = 20
  provider_disk_iops          = 100
  provider_volume_type        = "STANDARD"
  provider_encrypt_ebs_volume = true
  provider_instance_size_name = "M10"
  provider_region_name        = "EU_WEST_1"
}
