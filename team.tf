resource "mongodbatlas_teams" "devops" {
  org_id    = var.org_id
  name      = "devops"
  usernames = ["david@example.com"]
  provider  = mongodbatlas.mongo
}
