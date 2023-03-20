# Terraform script to provision multi-regional VPC and VPC peering

* VPC module created and .tfvars container value of variables. 
* First do aws configure to add Access Key ID and Secret Access Key of AWS IAM user. 
* Update variable details if needed to updated. If ok with same configuration then please proceed with below steps. 
* terraform init to initialize terraform module and provider. 
* terraform plan and terraform apply. 



[def]: https://www.google.com/imgres?imgurl=https%3A%2F%2Fdocs.aws.amazon.com%2Fimages%2Fvpc%2Flatest%2Fpeering%2Fimages%2Fpeering-intro-diagram.png&imgrefurl=https%3A%2F%2Fdocs.aws.amazon.com%2Fvpc%2Flatest%2Fpeering%2Fwhat-is-vpc-peering.html&tbnid=a-SKxdTGhjCy1M&vet=10CBgQxiAoCWoXChMI2LSinIfH_QIVAAAAAB0AAAAAEAc..i&docid=lSHOS-OMERSo8M&w=499&h=161&itg=1&q=png%20image%20for%20vpc%20peering&ved=0CBgQxiAoCWoXChMI2LSinIfH_QIVAAAAAB0AAAAAEAc