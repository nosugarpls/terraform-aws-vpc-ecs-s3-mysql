terraform {
    backend "s3" {
        bucket = "2012mytestbucket"
        key    = "state.tfstate"
    }
}
