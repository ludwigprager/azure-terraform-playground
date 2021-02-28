# Azure Terraform Playground

## TL;DR
1. Change `TF_VAR_keyvault_name` and 	`TF_VAR_sta_name` in `set-env.sh` to globally unique names.
Read more [here](./set-env.sh)
2. Run  
        ```
        ./00-service-principal.sh <subscription name>
        ```

## Description
This is a compact project that lets you test an Azure setup with terraform.
It essentially consists of a one-button process.
Also
- the terraform state will be stored in a storage account
- all steps are idempotent
- provides a script to clean up
- serves as an ideal starting point for a production project

## Objectives
- idempotent
- ready to use test environment for arbitrary azure+terraform deployments
- no editing of scripts necessary
- uniqueness of names for
-- keyvault and
-- storage-account
  must be globally unique
<!--
## Usage
1. create the service principal
    ```
    ./00-service-principal.sh
    ```
   Wait a few seconds until Azure is able to us
2.
-->

## Use Cases
- repeatedly apply and destroy your IaC (infrastructure as code) including the storage account
- repeatedly apply and destroy your IaC (infrastructure as code) but keep the storage account
- modify your IaC and test the roll-out

## Keep in mind
Since this is a test project 
- both storage account and vault will be deleted when running the 'tear down' script.
- no 'terraform plan' presented, the plan is applied without approval.
