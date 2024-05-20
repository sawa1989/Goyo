data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket = "literary-goyo-s3"
        key =  "ap-northeast-2/vpc/terraform.tfstate"
        region = "ap-northeast-2"
        dynamodb_table = "literary-goyo-table"
    }   
}