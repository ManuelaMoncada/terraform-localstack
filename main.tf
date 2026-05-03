terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "bucket_tarea2" {
  bucket = "mi-bucket-tarea2-localstack"

  tags = {
    Ambiente = "LocalStack"
    Tarea    = "Tarea3"
  }
}

module "bucket_modulo" {
  source      = "./modules/mi-recurso"
  bucket_name = "mi-bucket-modulo-localstack"
}
