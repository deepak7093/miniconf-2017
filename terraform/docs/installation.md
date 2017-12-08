

Installation
-------------

####To provision infrastructure on AWS using terraform, you need to have awscli configured, let's do that first.


#### 1) MacOS and Linux users can install awscli from the below link

 > http://docs.aws.amazon.com/cli/latest/userguide/cli-install-macos.html 

#### 2) Also set the Path in your profile 
> export PATH=$PATH:/PATH/OF/AWS

#### 3) Configure your aws profile by running 
> aws configure

It will asm for secret_key, access_key, region and output_format

#### 4) Now let's install terraform
>https://www.terraform.io/downloads.html

From the above link download terraform package according to your OS

#### 5) Set path in your profile
> export PATH=$PATH:/PATH/OF/Terraform

#### 6) Run terraform version to verify 
> terraform --version
