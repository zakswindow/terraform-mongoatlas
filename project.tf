resource "mongodbatlas_project" "Dev" {
  name     = "Dev"
  org_id   = var.org_id
  provider = mongodbatlas.mongo
}