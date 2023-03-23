# This has been done using Google Cloud
terraform {
required_providers {
google = {
source = "hashicorp/google"
version = "4.2.0"
        }
    }
}
provider "google" {
project = "dockerized-class-ulises"
}

#First one

resource "google_sql_database" "database" {
    name = "terraform-mysql"
    instance = google_sql_database_instance. instance.name
}
resource "google_sql_database_instance" "instance" {
    name = "mysql-melgarejo-development-db"
    region = "us-central1"
    database_version = "MYSQL_5_7"
settings {
    tier = "db-f1-micro"
}
deletion_protection = "false"
}
resource "google_sql_user" "user1" {
    name = "mysql-development-user"
    instance = google_sql_database_instance. instance.name
    password = "P@ssword20"
}

#Second one

resource "google_sql_database" "database2" {
    name = "terraform-mysql2"
    instance = google_sql_database_instance. instance.name
}
resource "google_sql_database_instance" "instance2" {
    name = "mysql-melgarejo-development-db2"
    region = "us-central1"
    database_version = "MYSQL_5_7"
settings {
    tier = "db-f1-micro"
}
deletion_protection = "false"
}
resource "google_sql_user" "user2" {
    name = "mysql-development-user"
    instance = google_sql_database_instance. instance.name
    password = "P@ssword20"
}

#THIRD ONE

resource "google_sql_database" "database3" {
    name = "terraform-mysq13"
    instance = google_sql_database_instance. instance.name
} 
resource "google_sql_database" "database9" {
    name = "terraform-mysq13"
    instance = google_sql_database_instance. instance.name
} 
resource "google_sql_database_instance" "instance3" {
    name = "mysql-melgarejo-db"
    region = "us-central1"
    database_version = "MYSQL_5_7"
settings {
    tier = "db-f1-micro"
}
deletion_protection = "false"
}
resource "google_sql_user" "user3" {
    name= "mysql-qa-user" 
    instance = google_sql_database_instance. instance3.name
    password = "P@ssword20"
}

#FOURTH ONE

resource "google_sql_database" "database4" {
    name = "terraform-postgres"
    instance = google_sql_database_instance. instance.name
}
resource "google_sql_database_instance" "instance4" {
    name = "postgres-melgarejo-development-db"
    region = "us-central1"
    database_version="POSTGRES_13"
settings {
    tier = "db-f1-micro"
}
deletion_protection = "false"
}
resource "google_sql_user" "user4" {
    name = "postgres-development-user"
    instance = google_sql_database_instance. instance4.name
    password = "P@ssword20"
}
#FIFTH ONE
resource "google_sql_database" "database5" {
    name = "terraform-postgres2"
    instance = google_sql_database_instance. instance.name
}
resource "google_sql_database_instance" "instance5" {
    name = "postgres-melgarejo-integrationtest"
    region = "us-central1"
    database_version="POSTGRES_13"
settings {
    tier = "db-f1-micro"
}
deletion_protection = "false"
}
resource "google_sql_user" "user5" {
    name = "postgres-integrationtest-user"
    instance = google_sql_database_instance. instance5.name
    password = "P@ssword20"
}
#SIXTH
resource "google_sql_database" "database6" {
    name = "terraform-postgres3"
    instance = google_sql_database_instance.instance.name
} 
resource "google_sql_database_instance" "instance6" {
    name = "postgres-melgarejo-qa-db"
    region = "us-central1"
    database_version="POSTGRES_13"
    settings{
    tier = "db-f1-micro"
    }
}

resource "google_sql_user" "user6" {
    name = "postgres-qa-user"
    instance = google_sql_database_instance. instance6.name
    password = "P@ssword20"
}
