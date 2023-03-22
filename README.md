# Setting up Terraform

## Installations

Install AWS CLI in the command line 

`brew install awscli`

Install AWS vault

*AWS vault is used to encrypt AWS credentials and store them securely. This should be installed whenever you work with AWS*

`brew install --cask aws-vault`

Install Terraform

`brew install terraform`

## Setting up AWS

Configuring AWS

`aws configure --profile tf-intro`

*tf-intro is the S3 bucket name*

No access key

No AWS secret

Default region name: `eu-west-2`

Default output format: `json`



Configure AWS vault `aws-vault add tf-intro`

*Enter access key ID and Secret*

`aws vault list` *will list out what you have in your vault*


Check if this works: 
`aws-vault exec tf-intro -- aws sts get-caller-identity`

*This should print a JSON object with user info to the console*


## Connecting Terraform


`aws-vault exec tf-intro -- terraform init`


To run:

`aws-vault exec tf-intro -- terraform apply` 

*Run this when you make changes, type 'yes' to confirm changes*

## Further learning resources:
[AWS Terraform Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

[Youtube course](https://www.youtube.com/watch?v=V4waklkBC38)

[Terraform Docs](https://developer.hashicorp.com/terraform/docs)

[Blog](https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180#3fd2)




