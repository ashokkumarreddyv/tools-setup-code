terraform {
  backend "s3" {
    bucket = "ashoks-03"
    key    = "tools/state"
    region = "us-east-1"

  }
}
