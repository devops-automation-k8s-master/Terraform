1-Please Open the "provider.tf" file and set the region and role ARN.
2-Create the "terraform.tfvars"to set variable values (or pass variable values on command line ).Other wise it will pick default values from "vars.tf" file.
3-Run "terraform init" command for intialization.
4-Run "terraform plan" to check the all configuration is right or not.
5-Run "terraform apply" to creating resource on aws.

Note:-
1-Terraform Version: v0.11.13

2-Please give the subnet_size as numberOfmchine you want to deploy in a subnet.
Example: 1000 ec2 machine in a subnet.


With the help of this 

