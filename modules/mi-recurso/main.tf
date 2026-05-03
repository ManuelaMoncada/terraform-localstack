variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

resource "aws_s3_bucket" "bucket_modulo" {
  bucket = var.bucket_name
}
