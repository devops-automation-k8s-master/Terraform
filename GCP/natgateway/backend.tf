terraform {
 backend "gcs" {
   bucket  = "terraform-state-files-bucket"
   prefix  = "terraform/networking/cloudnat"
 }
}