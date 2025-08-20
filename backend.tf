terraform {
  backend "s3" {
    bucket         = "tfstate-backend-bucket-1205"
    key            = "madhava/dotnet/terraform.tfstate"
    region         = "ap-south-1"      
    encrypt        = true
  }
}
