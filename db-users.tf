resource "mongodbatlas_database_user" "user_david" {
  provider = mongodbatlas.mongo

  username           = "david"
  password           = "47856fhgd75tfgjsdgdfkh"
  project_id         = mongodbatlas_project.dev.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "books"
  }

  labels {
    key   = "%s"
    value = "%s"
  }
}

resource "mongodbatlas_database_user" "user_james" {
  provider = mongodbatlas.mongo

  username           = "james"
  password           = "nfvurHGF63HF73434vhghsd"
  project_id         = mongodbatlas_project.dev.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "books"
  }

  labels {
    key   = "%s"
    value = "%s"
  }
}



