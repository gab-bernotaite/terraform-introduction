provider "aws" {
	region = "eu-west-2"
}

variable "name" {
    type = string

}

resource "aws_s3_bucket" "website" {
    bucket = "tf-intro-${var.name}"
}

resource "aws_s3_object" "index" {
	bucket = aws_s3_bucket.website.bucket
	key = "index.html"
    content_type = "text/html"
	content_base64 = filebase64("${path.root}/index.html")
    acl = "public-read"
}

resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket
  index_document {
    suffix = "index.html"
  }
}

output "website" {
  value = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}



